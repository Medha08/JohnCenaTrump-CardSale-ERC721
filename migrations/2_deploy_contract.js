const trumpCard = artifacts.require("TrumpCard");

module.exports = function(deployer) {
const trumpCard = artifacts.require("TrumpCard");
  deployer.deploy(trumpCard);
};