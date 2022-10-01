# Dependency Injection
**Dependency injection** is a design pattern in which an object or function receives other objects or functions that it depends on. A form of inversion of control, dependency injection aims to separate the concerns of constructing objects and using them, leading to loosely coupled programs.[^wiki]

如果不需要配置的话，类在内部自己创建依赖类，很好。但如果需要配置，随着配置越来越复杂，外部传参给类来创建依赖会变得越来越麻烦，很自然地就会想到由外部创建依赖后传入。配合依赖注入库，还可以进一步降低外部创建、注入和管理依赖的工作量。

[C++Now 2019: Kris Jusiak “Dependency Injection - a 25-dollar term for a 5-cent concept” - YouTube](https://www.youtube.com/watch?v=yVogS4NbL6U)

## Libraries
- [\[Boost::ext\].DI](https://boost-ext.github.io/di/) ([GitHub](https://github.com/boost-ext/di))  
  > boost-ext::di is strangly the only one that doesn't require a dependency on boost and is actually a solid library if you can use it for purely for compile-time DI but the runtime support is full of hidden gottyas which would lead to some very difficult to resolve bugs (imagine how difficult it would be to track down when you end up getting given different instances of something you registered as singleton/shared). Also, the author doesn't seem to be that active on the repo or responding to issues which is a big problem when adopting a library and although it is called boost-ext::di it has no affiliation with boost what so ever which feels a bit strange to me[^jonathanhiggs]
- [Hypodermic](https://github.com/ybainier/Hypodermic)  
  > Hypodermic is the most promising of them, it seems to work pretty well at runtime and is mostly unintrusive other than one big thing; the library is opinionated about the use of shared_ptr/unique_ptr. The library says that everything should be a shared_ptr so that if you change a registration to/from a shared instance then the constructor should not change. I think this might have been a sensible choice many years ago but now the idiomatic use of pointers has evolved to denote the lifetime of the instance, ie. sometimes I want to take a unique instance because I don't want to think about synchronization and unique ensures nothing else can be altering it. So while the intention was to be unintrusive it actually became very instrusive because now I have to change some constructors to support it[^jonathanhiggs]
- [kangaru](https://github.com/gracicot/kangaru)
- [Fruit](https://github.com/google/fruit)  
  > google.fruit is the worst requiring a strong dependency on the library to write every constructor with macros - so that is ruled out entirely just for that, didn't get past looking at the constructors[^jonathanhiggs]

[^wiki]: [Dependency injection - Wikipedia](https://en.wikipedia.org/wiki/Dependency_injection)
[^jonathanhiggs]: [DI in c++ hurt by lack of good libraries? : cpp](https://www.reddit.com/r/cpp/comments/p5et4v/di_in_c_hurt_by_lack_of_good_libraries/)