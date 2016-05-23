# UIScrollView-XYPlusingRefresh
下拉刷新样式和上拉加载的样式 scrollview tableview pullup refresh style 

采用全新的类别扩展方法 使用简单

###添加下拉刷新

```
  [table initDownRefreshCompletion:^(id refreshView) {
      tableCount = 40;
      [table reloadData];
      [refreshView endDownRefresh];
  }];
```

###添加上拉刷新

```
  [table initPullUpRefreshCompletion:^(id refreshView) {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
      tableCount += 10;
      [table reloadData];
      [refreshView endPullUpRefresh];
    });
  }];

```
 另:如果上拉刷新完成后 不再提供数据了 可以调用 

 ```
  if (tableCount > 80) {
        table.noMoreDataToPullUpRefresh = YES;
    }
 ```

#####以上方法均在例子中有展示

##特别说明
当使用全局错误断点的时候 有可能会跳转到该方法中 
```
/**
 *  如果在应用内打了全局错误断点 那么在每个错误的释放的时候都会断点到这里 这时候 只要跳过这个断点就可以了
 *
 *  这是一个kvo的bug 在有些scrollview中没有租车contentoffset的kvo 
 *  但是在释放的时候都会进入到这个dealloc中 导致错误的释放了KVO
 *  所以在这里加入了try catch 块
 *  这不是应用崩溃了 只是一个警告
 */
-(void)dealloc{
    @try {[self removeObserver:self forKeyPath:@"contentOffset"];}@catch (NSException *exception) {}
}

```
这个bug我一直在找办法解决
如果有好的方法还请知会我一下
email:772381545@qq.com


