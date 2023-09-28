//SPDX-License-Identifier: MIT

pragma solidity ^0.8.21;

import {Script} from "forge-std/Script.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";
import {MuskNft} from "../src/MuskNft.sol";

contract MintMuskNft is Script {
    string public constant PUG = "ipfs://bafkreihlnlo67mwv4emdlpulo5lt347hofqb4miiytw4ygbtnqcegxupg4";

    function run() external {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment("MuskNft", block.chainid);

        mintNftOnContract(mostRecentlyDeployed);
    }

    function mintNftOnContract(address contractAddress) public {
        vm.startBroadcast();
        MuskNft(contractAddress).mintNft(PUG);
        vm.stopBroadcast();
    }
}