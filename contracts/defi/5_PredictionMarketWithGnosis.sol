// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import './IERC20.sol'
import './IERC1155.sol'
import './IConditionalTokens.sol'

contract myPredictionMarketwithGnosis {
    IERC20 dai;
    IConditionalTokens conditionalTokens;
    address public oracle;
    mapping(bytes32 => mapping(uint => uint)) public tokenBalance;

    constructor(
        address _dai,
        address _conditionalTokens,
        address _oracle,
        ) public {
            dai = IERC20(_dai);
            conditionalTokens = IConditionalTokens(_conditionalTokens);
            oracle =_oracle;
            admin = msg.sender;
        }

        function createBet(bytes32 questionId, uint amount) external{
            conditionalTokens.prepareCondition(
                oracle,
                questionId,
                3
            );

            bytes32 conditionId = conditionalTokens.getConditionId(
                oracle,
                questionId,
                3
            );
            uint[] memory partition = new uint[](2);
            partition[0] =1;
            partition[1] = 3;

            dai.approve(address(conditionalTokens), amount);
            conditionalTokens.splitPosition(
                dai,
                bytes32(0),
                conditionId,
                partition,
                amount
            );

            tokenBalance[questionId][0] = amount;
            tokenBalance[questionId][1] = amount;
        }
        function transferToken(
            bytes32 questionId,
            uint indexSet,
            uint indexSet,

        ){

        }
    

         
    function redeemTOkens(
        bytes32 conditionId,
    )

    function onERC1155Received(
        address operator,
        address from,
        uint256 id,
        uint256 value,
        bytes calldata data
    )
        external
        returns(bytes4){

            return bytes4(keccak256("onERC1155Received(address,address,uint256,uint256,bytes)"));

        }

    /**
        @dev Handles the receipt of a multiple ERC1155 token types. This function
        is called at the end of a `safeBatchTransferFrom` after the balances have
        been updated. To accept the transfer(s), this must return
        `bytes4(keccak256("onERC1155BatchReceived(address,address,uint256[],uint256[],bytes)"))`
        (i.e. 0xbc197c81, or its own function selector).
        @param operator The address which initiated the batch transfer (i.e. msg.sender)
        @param from The address which previously owned the token
        @param ids An array containing ids of each token being transferred (order and length must match values array)
        @param values An array containing amounts of each token being transferred (order and length must match ids array)
        @param data Additional data with no specified format
        @
    */
    function onERC1155BatchReceived(
        address operator,
        address from,
        uint256[] calldata ids,
        uint256[] calldata values,
        bytes calldata data
    )
        external
        returns(bytes4){
            return bytes4(keccak256("onERC1155BatchReceived(address,address,uint256[],uint256[],bytes)"));
        }
    
}