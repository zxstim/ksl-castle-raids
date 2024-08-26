-include .env

build:
	forge build

test-all:
	forge test -vvvv

deploy-kairos-fklay:
	forge script script/DeployFakeKLAY.s.sol --rpc-url ${KAIROS_TESTNET_RPC_URL} --account dev --sender ${SENDER} --broadcast --gas-estimate-multiplier 200 -vvvv

deploy-kairos-castle-map:
	forge script script/DeployCastleMap.s.sol --rpc-url ${KAIROS_TESTNET_RPC_URL} --account dev --sender ${SENDER} --broadcast --gas-estimate-multiplier 200 -vvvv

deploy-kairos-raid-treasuries:
	forge script script/DeployRaidTreasuries.s.sol --rpc-url ${KAIROS_TESTNET_RPC_URL} --account dev --sender ${SENDER} --broadcast --gas-estimate-multiplier 200 -vvvv

interact-kairos:
	forge script script/Interactions.s.sol --rpc-url ${KAIROS_TESTNET_RPC_URL} --account dev --sender ${SENDER} --broadcast --gas-estimate-multiplier 200 -vvvv

create3-address:
	forge script script/CREATE3Guess.s.sol --rpc-url ${KAIROS_TESTNET_RPC_URL} --account dev --sender ${SENDER} --broadcast --gas-estimate-multiplier 200 -vvvv

create3-deploy-kairos:
	forge script script/CREATE3Deploy.s.sol --rpc-url ${KAIROS_TESTNET_RPC_URL} --account dev --sender ${SENDER} --broadcast --gas-estimate-multiplier 200 -vvvv

create3-deploy-kaia:
	forge script script/CREATE3Deploy.s.sol --rpc-url ${KAIA_MAINNET_RPC_URL} --account dev --sender ${SENDER} --broadcast --gas-estimate-multiplier 200 -vvvv