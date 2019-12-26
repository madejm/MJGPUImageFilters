//
//  MJFilterChain.swift
//  MJGPUImageFilters
//
//  Created by Mateusz Madej on 25/12/2019.
//  Copyright © 2019 Mateusz Madej. All rights reserved.
//

import GPUImage

public class MJFilterChain: GPUImageFilterGroup {
    
    public init(filters: [GPUImageOutput & GPUImageInput]) {
        
        super.init()
        
        guard let firstFilter = filters.first else {
            fatalError("filter chain requires at least one filter")
        }
        initialFilters = [ firstFilter ]
        
        filters.forEach { (filter: GPUImageOutput & GPUImageInput) in
            addNext(filter: filter)
        }
    }
    
    private func addNext(filter: GPUImageOutput & GPUImageInput) {
        addFilter(filter)
        if let tf = terminalFilter {
            tf.addTarget(filter)
        }
        terminalFilter = filter
    }
}
