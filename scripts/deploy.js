const hre = require("hardhat");
require("@nomiclabs/hardhat-waffle");
require('dotenv').config();
const TREASURY_ADDRESS = process.env.TREASURY_ADDRESS;
async function main() {
    const [deployer] = await hre.ethers.getSigners();

    const Convert = await hre.ethers.getContractFactory("Convert");
    const convert = await Convert.deploy();
    await convert.deployed();


    console.log("convert");
    const Blacklisting = await hre.ethers.getContractFactory("Blacklisting");
    console.log("1");
    const blacklisting = await Blacklisting.deploy();
    console.log("2");
    const Treasury = await hre.ethers.getContractFactory("Treasury");
    console.log("3");
    const treasury = await Treasury.deploy(TREASURY_ADDRESS);
    console.log("4");
    const ERC20Coin = await hre.ethers.getContractFactory("ERC20Coin");
    console.log("5");
   

    const ERC20CoinDeploy = await ERC20Coin.deploy(treasury.address + "", blacklisting.address + "");
    console.log("6");
    await ERC20CoinDeploy.deployed();

    console.log("Deploying contracts with the account:", deployer.address);

    console.log("Account balance:", (await deployer.getBalance()).toString());
    console.log("Token blacklisting address:", blacklisting.address);
    console.log("Token treasury address:", treasury.address);
    console.log("Token ERC20CoinDeploy address:", ERC20CoinDeploy.address);
}


main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });
