const hre = require("hardhat");

async function main() {
    const SimpleWallet = await hre.ethers.getContractFactory("SimpleWallet");
    const wallet = await SimpleWallet.deploy();

    await wallet.deployed();

    console.log("SimpleWallet deployed to:", wallet.address);
}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});
