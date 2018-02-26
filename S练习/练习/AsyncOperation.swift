//
//  AsyncOperation.swift
//  Operation
//
//  Created by apple on 2018/1/9.
//  Copyright © 2018年 apple. All rights reserved.
//

import UIKit

//Operation是操作的一个基类，我们一般可以通过继承的方式来实现一些自定义的操作类，例如通过自定义操作类我们能够更改操作的执行方式或者打印作业执行过程中的状态变化。如果我们直接继承Operation实现的操作类是同步（Sync）执行的，我们也可以通过手动管理state来实现操作类的异步（Async）执行。
class AsyncOperation: Operation {

    enum State: String {
        case Ready, Executing, Finished
        
        fileprivate var keyPath: String {
            return "is" + rawValue
        }
    }
    
    var state = State.Ready {
        willSet {
            willChangeValue(forKey: newValue.keyPath)
            willChangeValue(forKey: state.keyPath)
        }
        didSet {
            didChangeValue(forKey: oldValue.keyPath)
            didChangeValue(forKey: state.keyPath)
        }
    }
}

extension AsyncOperation {
    // Operation Overrides
    override var isReady: Bool {
        return super.isReady && state == .Ready
    }
    
    override var isExecuting: Bool {
        return state == .Executing
    }
    
    override var isFinished: Bool {
        return state == .Finished
    }
    
    override var isAsynchronous: Bool {
        return true
    }
    
    override func start() {
        if isCancelled {
            state = .Finished
            return
        }
        main()
        state = .Executing
    }
    
    override func cancel() {
        state = .Finished
    }
}
/*
实现了AsyncOperation之后，我们可以通过以下步骤调用：

1.继承AsyncOperation
2.重写main方法，在main方法中执行Async操作
3.在Async的callback方法中将state置为.Finished
 
class MyLoginOperation: AsyncOperation {
    override func main() {
        RequestAPI.login(params, callback: {
            self.state = .Finished
            // TODO: login success
        })
    }
}
let op = MyLoginOperation()
OperationQueue().addOperation(op)
 */
