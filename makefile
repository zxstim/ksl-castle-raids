-include .env

build:
	forge build

test-all:
	forge test -vvvv

deploy-gold:
	forge script script/DeployGold.s.sol --rpc-url ${KAIROS_TESTNET_RPC_URL} --account dev --sender ${SENDER} --broadcast --gas-estimate-multiplier 200 -vvvv

deploy-castle-map:
	forge script script/DeployCastleMap.s.sol --rpc-url ${KAIROS_TESTNET_RPC_URL} --account dev --sender ${SENDER} --broadcast --gas-estimate-multiplier 200 -vvvv

deploy-raid-treasuries:
	forge script script/DeployRaidTreasuries.s.sol --rpc-url ${KAIROS_TESTNET_RPC_URL} --account dev --sender ${SENDER} --broadcast --gas-estimate-multiplier 200 -vvvv

disburse-gold-to-castles:
	forge script script/DisburseGold.s.sol --rpc-url ${KAIROS_TESTNET_RPC_URL} --account dev --sender ${SENDER} --broadcast --gas-estimate-multiplier 200 -vvvv

deploy-diamondgemstone:
	forge script script/DeployDiamondGemstone.s.sol --rpc-url ${KAIROS_TESTNET_RPC_URL} --account dev --sender ${SENDER} --broadcast --gas-estimate-multiplier 200 -vvvv

mint-diamondgemstone:
	forge script script/MintDiamondGemstone.s.sol --rpc-url ${KAIROS_TESTNET_RPC_URL} --account dev --sender ${SENDER} --broadcast --gas-estimate-multiplier 200 -vvvv

disburse-diamondgemstone-to-castles:
	forge script script/DisburseDiamondGemStone.s.sol --rpc-url ${KAIROS_TESTNET_RPC_URL} --account dev --sender ${SENDER} --broadcast --gas-estimate-multiplier 200 -vvvv

deploy-gem-vaults:
	forge script script/DeployGemVaults.s.sol --rpc-url ${KAIROS_TESTNET_RPC_URL} --account dev --sender ${SENDER} --broadcast --gas-estimate-multiplier 200 -vvvv