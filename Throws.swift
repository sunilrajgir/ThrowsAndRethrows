enum CustomError: Error {
    case customError
}
\
       func memoryManagement() {
        var modifier: (Int) throws -> Int = { item in
            if Bool.random() {
                return item*2
            } else {
                throw CustomError.customError
            }
        }
        let items = try? [1,2,3,4].customMap { item in
            return try modifier(item)
        }
        print(items)
       }

extension Array {
    func customMap<T>(completion:((_ item:Element) throws -> T)) throws -> [T] {
        var res = [T]()
        for item in self {
            let modifiedItem = try completion(item)
            res.append(modifiedItem)
        }
        return res
    }
}
