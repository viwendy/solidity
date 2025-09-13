// SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;
/**
 * 创建一个名为Voting的合约，包含以下功能：
    一个mapping来存储候选人的得票数
    一个vote函数，允许用户投票给某个候选人
    一个getVotes函数，返回某个候选人的得票数
    一个resetVotes函数，重置所有候选人的得票数
 */
contract Voting  {
    
    mapping (string => uint) votes;
    string[] candidates;
    address own;

    constructor(){
        own = msg.sender;
    }

    function vote(string memory user) public  {
        candidates.push(user);
        votes[user]++;
    }
 
    function getVotes(string memory user) public view returns (uint) {
        return votes[user];
    }

    function resetVotes() public {
        require(msg.sender == own, "no permisson");
        for (uint i = 0; i < candidates.length; i++){
            delete (votes[candidates[i]]);
        }
    }

}