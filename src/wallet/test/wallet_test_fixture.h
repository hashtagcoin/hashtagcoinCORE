// Copyright (c) 2016 The Hashtagcoin Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef HASHTAGCOIN_WALLET_TEST_FIXTURE_H
#define HASHTAGCOIN_WALLET_TEST_FIXTURE_H

#include "test/test_hashtagcoin.h"

/** Testing setup and teardown for wallet.
 */
struct WalletTestingSetup: public TestingSetup {
    WalletTestingSetup(const std::string& chainName = CBaseChainParams::MAIN);
    ~WalletTestingSetup();
};

#endif

