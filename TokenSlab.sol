// SPDX-License-Identifier: MIT

pragma solidity >=0.5.0 <0.9.0;

contract TokenSlab {
    uint256[5] tokenSlabs; // Array to store the tokens
    mapping(address => string[]) depositEnquiry; // storing in which slabs whose tokens are deposited

    //Function to deposit the tokens

    function deposit(uint256 _tokensQunatity) public returns (string memory) {
        if (_tokensQunatity > 0) {
            if (
                totalTokensDeposit() + _tokensQunatity <= 1500 &&
                _tokensQunatity > 0
            ) {
                uint256 tokenLeft = _tokensQunatity;

                //Checking if there is any space in Slab 5 if yes, then depositing the tokens in slab 5 if not, then checking for space in lower level slabs

                if ((500 - tokenSlabs[4]) > 0) {
                    if ((500 - tokenSlabs[4]) >= tokenLeft) {
                        tokenSlabs[4] += tokenLeft;
                        tokenLeft = 0;

                        depositEnquiry[msg.sender].push("SLAB 5");
                        return "tokens deposited successfully in Slab 5";
                    } else {
                        tokenLeft -= (500 - tokenSlabs[4]);
                        tokenSlabs[4] = 500;
                        depositEnquiry[msg.sender].push("SLAB 5");
                    }
                }

                //Checking if there is any space in Slab 4 if yes, then depositing the tokens in slab 4 if not, then checking for space in lower level slabs

                if ((400 - tokenSlabs[3]) > 0 && tokenLeft > 0) {
                    if ((400 - tokenSlabs[3]) >= tokenLeft) {
                        tokenSlabs[3] += tokenLeft;
                        tokenLeft = 0;
                        depositEnquiry[msg.sender].push("SLAB 4");
                        return "tokens deposited successfully in Slab 4";
                    } else {
                        tokenLeft -= (400 - tokenSlabs[3]);
                        tokenSlabs[3] = 400;
                        depositEnquiry[msg.sender].push("SLAB 4");
                    }

                    //Checking if there is any space in Slab 3 if yes, then depositing the tokens in slab 3 if not, then checking for space in lower level slabs
                }
                if ((300 - tokenSlabs[2]) > 0 && tokenLeft > 0) {
                    if ((300 - tokenSlabs[2]) >= tokenLeft) {
                        tokenSlabs[2] += tokenLeft;
                        tokenLeft = 0;
                        depositEnquiry[msg.sender].push("SLAB 3");
                        return "tokens deposited successfully in Slab 3";
                    } else {
                        tokenLeft -= (300 - tokenSlabs[2]);
                        tokenSlabs[2] = 300;
                        depositEnquiry[msg.sender].push("SLAB 3");
                    }
                }

                //Checking if there is any space in Slab 2 if yes, then depositing the tokens in slab 2 if not, then checking for space in lower level slabs

                if ((200 - tokenSlabs[1]) > 0 && tokenLeft > 0) {
                    if ((200 - tokenSlabs[1]) >= tokenLeft) {
                        tokenSlabs[1] += tokenLeft;
                        tokenLeft = 0;
                        depositEnquiry[msg.sender].push("SLAB 2");
                        return "tokens deposited successfully in Slab 2";
                    } else {
                        tokenLeft -= (200 - tokenSlabs[1]);
                        tokenSlabs[1] = 200;
                        depositEnquiry[msg.sender].push("SLAB 2");
                    }
                }

                //Checking if there is any space in Slab 1 if yes, then depositing the tokens in slab 1 if not, then cdisplaying the message that storage is full

                if ((100 - tokenSlabs[0]) > 0 && tokenLeft > 0) {
                    if ((100 - tokenSlabs[0]) >= tokenLeft) {
                        tokenSlabs[0] += tokenLeft;
                        tokenLeft = 0;
                        depositEnquiry[msg.sender].push("SLAB 1");
                        return "tokens deposited successfully in Slab 1";
                    } else {
                        tokenLeft -= (100 - tokenSlabs[0]);
                        tokenSlabs[0] = 100;
                        depositEnquiry[msg.sender].push("SLAB 1");
                    }
                }
            } else {
                if (_tokensQunatity > 1500) {
                    return "Quantity must be less than 1500";
                } else return "Storage full";
            }
        } else {
            return "Deposit value must be more than 0";
        }
        return "Some error has occured";
    }

    function totalTokensDeposit() public view returns (uint256) {
        return
            tokenSlabs[0] +
            tokenSlabs[1] +
            tokenSlabs[2] +
            tokenSlabs[3] +
            tokenSlabs[4];
    }

    function knowYourTokenSlab(address WalletAddress)
        public
        view
        returns (string[] memory)
    {
        return depositEnquiry[WalletAddress];
    }
}
