//
//  IndexAxisMapValueFormatter.swift
//  Charts
//
//  Created by Trinh khanh Hiep on 6/22/20.
//


import Foundation
import Charts
@objc(IndexAxisMapValueFormatter)
open class IndexAxisMapValueFormatter: NSObject, IAxisValueFormatter
{
    private var _values: [String] = [String]()
    private var _indexs: [Int] = [Int]()
    private var _valueCount: Int = 0
    private var _indexCount: Int = 0
    @objc public var values: [String]
    {
        get
        {
            return _values
        }
        set
        {
            _values = newValue
            _valueCount = _values.count
        }
    }
    @objc public var indexs: [Int]
    {
        get
        {
            return _indexs
        }
        set
        {
            _indexs = newValue
            _indexCount = _indexs.count
        }
    }
    public func getIndexOf(_ index:Int)->Int {
        for (i,element) in _indexs.enumerated() {
            if(element==index){
                return i
            }
        }
        return Int(-1)
    }
    public override init()
    {
        super.init()
        
    }
    
    @objc public init(_ values: [String], _ indexs: [Int])
    {
        super.init()
        self.values = values
        self.indexs = indexs
        
    }
    
    @objc public static func with(values: [String], indexs: [Int]) -> IndexAxisMapValueFormatter?
    {
        return IndexAxisMapValueFormatter(values,indexs)
    }
    
    open func stringForValue(_ value: Double,
                             axis: AxisBase?) -> String
    {
        
        let index = self.getIndexOf(Int(value.rounded()))
        print(index)
        if index<0 || index>_valueCount{
            return ""
        }else {
            return _values[index]
        }
    }
}
