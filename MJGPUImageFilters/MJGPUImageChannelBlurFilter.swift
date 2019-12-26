//
//  MJGPUImageChannelBlurFilter.swift
//  MJGPUImageFilters
//
//  Created by Mateusz Madej on 25/12/2019.
//  Copyright © 2019 Mateusz Madej. All rights reserved.
//

import GPUImage

public class MJGPUImageChannelFilter: GPUImageFilterGroup {
    
    public init(filter: GPUImageOutput & GPUImageInput, red: CGFloat, green: CGFloat, blue: CGFloat) {
        super.init()
        
        if red > 1 || green > 1 || blue > 1 {
            fatalError("color value cannot be greater than 1.0")
        }
        
        if red < 0 || green < 0 || blue < 0 {
            fatalError("color value cannot be lower than 0.0")
        }

        let rgbFilter = GPUImageRGBFilter()
        rgbFilter.red = red
        rgbFilter.green = green
        rgbFilter.blue = blue
        addFilter(rgbFilter)
        
        rgbFilter.addTarget(filter)
        addFilter(filter)

        let invertedFilter = GPUImageRGBFilter()
        invertedFilter.red = 1-red
        invertedFilter.green = 1-green
        invertedFilter.blue = 1-blue
        addFilter(invertedFilter)
        
        let sum = GPUImageAddBlendFilter()
        filter.addTarget(sum)
        invertedFilter.addTarget(sum)
        addFilter(sum)
        
        initialFilters = [ rgbFilter, invertedFilter ]
        terminalFilter = sum
    }
}
