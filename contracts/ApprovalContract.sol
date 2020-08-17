// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.5.16;

contract ApprovalContract {
  address public sender;
  address payable public reciever;
  address public constant approver = "<test_account_address>"; // Please note that this shouldn't be a string, it is an address type value // 0x7Fd26F292815819b55e676886966acBD9A39f9cb; // This is a valid ethereum address generated by truffle development server

  function deposit(address payable _reciever) external payable {
    require(msg.value > 0);
    sender = msg.sender;
    reciever = _reciever;
  }

  function viewApprover() external pure returns(address) {
    return(approver);
  }

  function approve() external {
    require(msg.sender == approver);
    reciever.transfer(address(this).balance);
  }
}