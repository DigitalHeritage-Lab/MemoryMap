enum LoadingStatus {
  initial,
  loading,
  loaded,
  error;

  bool get isLoading =>
      this == LoadingStatus.initial || this == LoadingStatus.loading;
  bool get isError => this == LoadingStatus.error;
  bool get isLoaded => this == LoadingStatus.loaded;
}
