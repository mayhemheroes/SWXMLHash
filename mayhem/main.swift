#if canImport(Darwin)
import Darwin.C
#elseif canImport(Glibc)
import Glibc
#elseif canImport(MSVCRT)
import MSVCRT
#endif

import Foundation
import SWXMLHash

@_cdecl("LLVMFuzzerTestOneInput")
public func test(_ start: UnsafeRawPointer, _ count: Int) -> CInt {
    let fdp = FuzzedDataProvider(start, count)

    let _ = XMLHash.config {
                config in
                config.shouldProcessNamespaces = fdp.ConsumeBoolean()
                config.shouldProcessNamespaces = fdp.ConsumeBoolean()
                config.caseInsensitive = fdp.ConsumeBoolean()
                config.encoding = fdp.ConsumeEnum(from: String.Encoding.self) ?? String.Encoding.utf8
            }
            .parse(fdp.ConsumeRemainingString())
    return 0;
}