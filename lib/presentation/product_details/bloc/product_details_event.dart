

sealed class ProductEvent{}



class LoadingProduct extends ProductEvent{}

class LoadedProduct extends ProductEvent{}

class AddCounter extends ProductEvent{}

class SubtractCounter extends ProductEvent{}