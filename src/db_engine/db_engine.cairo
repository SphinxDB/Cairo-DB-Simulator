//proof of query
#[starknet::contract]
mod db_engine{
    //use debug::PrintTrait;
    use core::traits::TryInto;
use starknet::ContractAddress;
    use array::ArrayTrait;
    use option::OptionTrait;
    use box::BoxTrait;

    use starknet::get_caller_address;

    const INSERT: u8 = 0_u8;
    const DELETE: u8 = 1_u8;
    const UPDATE: u8 = 2_u8;

    struct Operation {
        operation: u8,
        index: u64,
        value: felt252
    }

    struct Object{
        userid: u64,
        balance: u256
    }

    #[event]
    #[derive(Drop, starknet::Event)]
    enum Event{
        state_updated: state_updated
    }

    #[derive(Drop, starknet::Event)]
    struct  state_updated{
        #[key]
        previous_state : Array<felt252>,
        #[key]
        final_state : Array<felt252>
    }


    #[storage]
    struct Storage {
        //db_state : Array<felt252>,
        db_state: LegacyMap::<usize, felt252>,
        db_state_len: usize,
        owner: ContractAddress
        //state: obejects
    }

    #[constructor]
    fn constructor(ref self: ContractState) {
        let caller = get_caller_address();
        self.owner.write(caller);
    }

    fn get_db_state(self: @ContractState,)-> felt252{
        self.db_state.read(0)
    }

    #[external(v0)]
    fn update_db_state(ref self: ContractState, initial_state_array : Array<felt252>, operation_list: Array<felt252> , final_state_array: Array<felt252>){
        
        
        let mut initial_state = initial_state_array;
        let mut final_state = final_state_array;

        let mut i: u32 = 0 ;
        loop {
            if i > operation_list.len() { 
                break ();
            }
            if *operation_list.get(0).unwrap().unbox() == 0{
                let index: u64 = (*operation_list.get(1).unwrap().unbox()).try_into().unwrap();
                let value = *operation_list.get(2).unwrap().unbox();

                //insert_element(ref self, index,  value, ref initial_state, ref final_state);
            } else if *operation_list.get(0).unwrap().unbox() == 1{
                let index: u64 = (*operation_list.get(1).unwrap().unbox()).try_into().unwrap();
                let value = *operation_list.get(2).unwrap().unbox();

                //delete_element(ref self, index , ref initial_state, ref final_state);
            } else if *operation_list.get(0).unwrap().unbox() == 2{
                let index: u64 = (*operation_list.get(1).unwrap().unbox()).try_into().unwrap();
                let value = *operation_list.get(2).unwrap().unbox();

                //update_element(ref self ,index, *operation_list.get(2).unwrap().unbox() , ref initial_state, ref final_state);
            }
    
            i = i + 1;
        };    

    }
    
    #[external(v0)]
    fn insert_element(ref self: ContractState,index : u64, value: felt252, mut initial_state:  Array<felt252>, final_state:  Array<felt252>) {
        //let mut numbers = ArrayTrait::new();

        initial_state.append(value);
        self.db_state.write(2, value);

        
        //assert(initial_state == final_state, "query failed");
        
    }
    #[external(v0)]
    fn delete_element(ref self: ContractState,index: u64, initial_state:  Array<felt252>, final_state:  Array<felt252>) {
        
        //assert(initial_state == final_state, "query failed");
        
    }
    #[external(v0)]
    fn update_element(ref self: ContractState,index : u64, value : felt252, initial_state:  Array<felt252>, final_state:  Array<felt252>) {
        
        //assert(initial_state == final_state, "query failed");
        
    }

}