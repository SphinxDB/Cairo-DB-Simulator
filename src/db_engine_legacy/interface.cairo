#[starknet::interface]
trait DB_ENGINE<TContractState> {

  fn get_db_state(self: @TContractState, ) -> felt252;

  fn update_db_state(
    ref self: TContractState,
    initial_state_array : Array<felt252>,
    operation_list: Array<felt252>,
    final_state_array: Array<felt252>
    );

  fn insert_element(
    ref self: TContractState,
    index : u64,
    value: felt252,
    initial_state:  Array<felt252>,
    final_state:  Array<felt252>
  );
  
  fn delete_element(
    ref self: TContractState,
    index : u64,
    initial_state:  Array<felt252>,
    final_state:  Array<felt252>
  );

  fn update_element(
    ref self: TContractState,
    index : u64,
    value: felt252,
    initial_state:  Array<felt252>,
    final_state:  Array<felt252>
  );



}