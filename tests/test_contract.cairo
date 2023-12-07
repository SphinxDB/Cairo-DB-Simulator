use starknet::ContractAddress;

use snforge_std::{declare, ContractClassTrait};

use cairo_db_simulator::db_engine::interface::DB_ENGINESafeDispatcher;
use cairo_db_simulator::db_engine::interface::DB_ENGINESafeDispatcherTrait;

fn deploy_contract(name: felt252) -> ContractAddress {
    let contract = declare(name);
    contract.deploy(@ArrayTrait::new()).unwrap()
}

#[test]
fn test_update_db_state() {
    let contract_address = deploy_contract('HelloStarknet');

    let safe_dispatcher = DB_ENGINESafeDispatcher { contract_address };

    let db_state = safe_dispatcher.get_db_state().unwrap();
    assert(db_state == 0, 'Invalid state');

    //safe_dispatcher.update_element(42).unwrap();

    let balance_after = safe_dispatcher.get_db_state().unwrap();
    assert(balance_after == 42, 'Invalid balance');
}

#[test]
fn test_insert_element() {
    let contract_address = deploy_contract('DB_ENGINE');

    let safe_dispatcher = DB_ENGINESafeDispatcher { contract_address };

    let balance_before = safe_dispatcher.get_db_state().unwrap();
    assert(balance_before == 0, 'Invalid balance');

    // match safe_dispatcher.update_db_state(0,0,0) {
    //     Result::Ok(_) => panic_with_felt252('Should have panicked'),
    //     Result::Err(panic_data) => {
    //         assert(*panic_data.at(0) == 'Amount cannot be 0', *panic_data.at(0));
    //     }
    // };
}
