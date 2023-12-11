trait QueryTrait<S> {
    fn execute(state: S) -> S;
}
