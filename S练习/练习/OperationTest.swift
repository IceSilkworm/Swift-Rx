//
//  OperationTest.swift
//  练习
//
//  Created by apple on 2018/1/9.
//  Copyright © 2018年 hudun. All rights reserved.
//

import Foundation

class OperationTest {
    
    
    func test() {
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //BlockOperation,继承自Operation，可以并发的执行一个或多个block，只有当所有的block都执行完毕，整个操作才算执行完毕。示例代码如下：
        
        //        let blockOperation = BlockOperation {
        //            sleep(2)
        //            print("🍎")
        //        }
        //        blockOperation.addExecutionBlock {
        //            print("🍏")
        //        }
        //        blockOperation.addExecutionBlock {
        //            print("🍐")
        //        }
        //        blockOperation.addExecutionBlock {
        //            print("🍇")
        //        }
        //        blockOperation.completionBlock = {
        //            print("all works cmplete!")
        //        }
        //        blockOperation.start()
        
        
        
        //上面我们提到了我们可以调用operation自身的start方法出发作业执行，但是在日常开发中，我们往往采用将operation添加到一个指定的queue中来执行作业。操作队列是OperationQueue的一个实例，任务一旦被添加到操作队列中不久便会自动执行操作，所以如果需要设置操作或队列的一些属性，需要在其被添加到队列之前设置，在添加到队列之后的设置将不会生效。操作队列默认是一个并行队列，我们可以通过maxConcurrentOperationCount这个属性设置队列的并发数，当并发数为1的时候，操作队列就是一个串行队列。操作队列默认是（Async）异步执行的，我们也可以通过调用waitUntilAllOperationsAreFinished()方法或将addOperations(_ ops: [Operation], waitUntilFinished wait: Bool)方法的waitUntilFinished属性设置为true,使其成为同步（Sync）同步队列。
        let op1 = BlockOperation {
            sleep(2)
            print("🍎")
        }
        let op2 = BlockOperation {
            print("🍏")
        }
        let op3 = BlockOperation {
            print("🍐")
        }
        let op4 = BlockOperation {
            print("🍇")
        }
        let queue = OperationQueue()
        //queue.maxConcurrentOperationCount = 4
        //queue.addOperations([op1, op2, op3, op4], waitUntilFinished: true)
        //🍏
        //🍐
        //🍇
        //🍎
        //这个结果我们并不感到意外，由于是并发队列，并且op1的作业中含有延时操作，所以前三个的输出顺序并不一定，但是第四个输出的一定是🍎。如果我们把上面第2步的代码修改如下：
        
        //queue.maxConcurrentOperationCount = 4
        //queue.addOperations([op1,op2,op3,op4], waitUntilFinished: false)
        //🍏
        //🍐
        //🍇
        //此时队列并发异步执行操作，由于op1的延时处理，op1的执行将被直接返回，所以最终输出结果中并没有op1的输出。如果将上面的代码修改如下：
        
        
        
        queue.maxConcurrentOperationCount = 1
        queue.addOperations([op1,op2,op3,op4], waitUntilFinished: false)
        //🍎
        //🍏
        //🍐
        //🍇
        //此时操作队列是一个串行队列，所以程序执行2s后依次执行队列中的操作，按FIFO的顺序输出了结果。如果我们将上面的代码修改为如下：
        
        
        //Dependencies
        //如果在开发过程中我们想要操作按我们指定的顺序来执行，operation为我们提供了一种十分便捷的方式，operation支持互相设置依赖，如op1依赖于op2，op2依赖于op3，那么操作的执行顺秀就会是op3->op2->op1。示例代码如下:
        
        //Suspending and Resuming Queues
        //另外操作队列可以非常方便的进行挂起和恢复操作，我们可以通过队列的isSuspended属性设置队列的挂起和恢复，但是队列的挂起，不会影响已经被添加到队列中的操作，只有后续被添加到队列的操作会收到影响。我们直接看示例代码：
        
        
        // 在实际开发过程中，我们常常将一些耗时操作放到子线程，待操作完成后，我们切回main线程，进行一些UI相关的操作。其实这一过程可以用操作队列很方便的实现。
        
        OperationQueue().addOperation {
            // TODO: some time consuming operations
            OperationQueue.main.addOperation {
                // TODO: some UI operations
            }
        }
    }
}
