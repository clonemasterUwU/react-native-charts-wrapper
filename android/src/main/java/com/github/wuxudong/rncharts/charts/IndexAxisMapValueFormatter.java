package com.github.wuxudong.rncharts.charts;

import com.github.mikephil.charting.formatter.ValueFormatter;
public class IndexAxisMapValueFormatter extends ValueFormatter {
    private String[] mValue = new String[] {};
    private  int[] mIndex = new int[] {};
    private int mValueCount = 0;
    private int mIndexCount = 0;
    /**
     * An empty constructor.
     * Use `setValues` to set the axis labels.
     */
    public IndexAxisMapValueFormatter() {
    }

    /**
     * Constructor that specifies axis labels.
     *
     * @param values The values string array
     */
    public IndexAxisMapValueFormatter(String[] values, int[] indexs) {
        if (values != null && indexs != null){
            setValues(values);
            setIndexs(indexs);
        }
    }
    public void setValues(String[] values){
        this.mValue = values;
        this.mValueCount = values.length;
    }
    public void setIndexs(int[] indexs){
        this.mIndex = indexs;
        this.mIndexCount = indexs.length;
    }
    public int getIndexOf(int index){
        for (int i=0; i < mIndexCount; i++){
            if(mIndex[i] == index)
                return i;
        }
        return -1;
    }
    @Override
    public String getFormattedValue(float value) {
        int index = getIndexOf(Math.round(value));

        if (index < 0 || index >= mValueCount)
            return "";

        return mValue[index];
    }
}
