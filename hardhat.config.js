require("@nomiclabs/hardhat-waffle");

// This is a sample Hardhat task. To learn how to create your own go to
// https://hardhat.org/guides/create-task.html
task("accounts", "Prints the list of accounts", async (taskArgs, hre) => {
  const accounts = await hre.ethers.getSigners();

  for (const account of accounts) {
    console.log(account.address);
  }
});

// You need to export an object to set up your config
// Go to https://hardhat.org/config/ to learn more

/**
 * @type import('hardhat/config').HardhatUserConfig
 */
require("@nomiclabs/hardhat-waffle");

// Go to https://www.alchemyapi.io, sign up, create
// a new App in its dashboard, and replace "KEY" with its key


// Replace this private key with your Ropsten account private key
// To export your private key from Metamask, open Metamask and
// go to Account Details > Export Private Key
// Be aware of NEVER putting real Ether into testing accounts


module.exports = {
  solidity: "0.8.13",
  networks: {
    rinkeby: {
      url: "https://rinkeby.infura.io/v3/84581d9718b245a7980d0e379d4a3214", 
      accounts: [
        "cc2f844beb67482cd07fa8040c8dada8e2ee2922740ad7bb3d7d0311e71ef59e",
      ], 
    },
  }
};
