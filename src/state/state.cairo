#[derive(Copy, Drop)]
struct State {
    state: Array::felt252, //placehoder and mock for now
    queries: Array::felt252,
}

// following implementation is `State`s implementation

trait StateTrait<S> {
    fn init(data: Array::felt252, queries: Array::felt252) -> S;
    fn setState(ref self: S, updated_state: S);
    fn getState(ref self: S) -> S;
    fn set(ref self: S, key: felt252, value: felt252);
    fn get(ref self: S, ket: felt252);
    fn compare(ref self: S, other: S) -> bool;
}

impl StateImpl of StateTrait<State> {
    fn init(data: Array::felt252, queries: Array::felt252) -> S {
        State { state: data, queries: queries }
    }
    fn setState(ref self: S, updated_state: S) -> S {
        self.state = updated_state.state
    }
    fn getState(ref self: S) -> S {
        self.state
    }
    fn set(ref self: S, key: felt252, value: felt252) { //find the key and update value
    }
    fn get(ref self: S, ket: felt252) { //fetch the key
    }
    fn compare(ref self: S, other: S) -> bool {
        self.state == other.state && self.queries == other.queries
    }
}
