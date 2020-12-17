extension ListGetExtension<T> on List<T> {
  T tryGet(int index) => index < 0 || index >= this.length ? null : this[index];
}
