// Copyright (c) 2011-2014 The Hashtagcoin Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef HASHTAGCOIN_QT_HASHTAGCOINADDRESSVALIDATOR_H
#define HASHTAGCOIN_QT_HASHTAGCOINADDRESSVALIDATOR_H

#include <QValidator>

/** Base58 entry widget validator, checks for valid characters and
 * removes some whitespace.
 */
class HashtagcoinAddressEntryValidator : public QValidator
{
    Q_OBJECT

public:
    explicit HashtagcoinAddressEntryValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

/** Hashtagcoin address widget validator, checks for a valid hashtagcoin address.
 */
class HashtagcoinAddressCheckValidator : public QValidator
{
    Q_OBJECT

public:
    explicit HashtagcoinAddressCheckValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

#endif // HASHTAGCOIN_QT_HASHTAGCOINADDRESSVALIDATOR_H
