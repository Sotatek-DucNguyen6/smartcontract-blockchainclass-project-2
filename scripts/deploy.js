const hre = require("hardhat");

async function main() {
    const [deployer] = await hre.ethers.getSigners();
    //const Blacklisting = await hre.ethers.getContractFactory("Blacklisting");
    console.log("1");
    //const blacklisting = await Blacklisting.deploy();
    console.log("2");
    //await blacklisting.deployed();
    console.log("3");
    const ERC20Coin = await hre.ethers.getContractFactory("ERC20Coin");
    console.log("4");
    const ERC20CoinDeploy = await ERC20Coin.deploy();
    console.log("5");
    await ERC20CoinDeploy.deployed();

    console.log("Deploying contracts with the account:", deployer.address);

    console.log("Account balance:", (await deployer.getBalance()).toString());

    console.log("Token address:", ERC20CoinDeploy.address);
}


main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });
