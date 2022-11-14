import Metal

let device = MTLCreateSystemDefaultDevice()!

print("Device name: \(device.name)")

let buffer = device.makeBuffer(length: 16, options: [])!
let commandQueue = device.makeCommandQueue()!
let commandBuffer = commandQueue.makeCommandBuffer()!

//commandBuffer.addCompletedHandler { completedCommandBuffer in
//    print("Command buffer completed")
//}
//
//commandBuffer.commit()



print("Buffer is \(buffer.length) bytes in length")


let sourceBuffer = device.makeBuffer(length: 16, options: [])!
let destinationBuffer = device.makeBuffer(length: 16, options: [])!
let points = sourceBuffer.contents().bindMemory(to: SIMD2<Float>.self, capacity: 2)

points[0] = SIMD2<Float>(10, 10)
points[1] = SIMD2<Float>(100, 100)

let p1 = points[1]
print("p1 is \(p1)")

let blitCommandEncoder = commandBuffer.makeBlitCommandEncoder()!

blitCommandEncoder.copy(
    from: sourceBuffer,
    sourceOffset: 0,
    to: destinationBuffer,
    destinationOffset: 0,
    size: MemoryLayout<SIMD2<Float>>.stride * 2
)

blitCommandEncoder.endEncoding()

commandBuffer.addCompletedHandler { completedCommandBuffer in
    let outPoints = destinationBuffer.contents().bindMemory(to: SIMD2<Float>.self, capacity: 2)
    
    let p1 = outPoints[1]
    print("p1 in destination buffer is \(p1)")
}

commandBuffer.commit()
