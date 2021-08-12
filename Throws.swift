
func test() {
       var modifier: (Int) -> Int = { item in
          return item*2
      }
      let items = [1,2,3,4].customMap { item in
          return modifier(item)
      }
      print(items)
      // 2,4,6,8
}

extension Array {
    func customMap<T>(completion:((_ item:Element) -> T)) -> [T] {
        var res = [T]()
        for item in self {
            let modifiedItem = completion(item)
            res.append(modifiedItem)
        }
        return res
    }
}
