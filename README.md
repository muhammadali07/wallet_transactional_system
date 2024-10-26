# Internal Wallet Transactional System With Ruby on Rails

## Overview
This is a Ruby on Rails API-based internal wallet transactional system that allows for transfers and withdrawals across various entities (User, Team, Stock, etc.).

## Features
- Supports transactions between wallets
- Validations for balance, wallet, and transaction integrity
- Custom session-based sign-in
- Integration with LatestStockPrice API for stock price retrieval

## Setup
1. Clone the repository.
2. Run `bundle install`.
3. Run migrations with `rails db:migrate`.
4. Set up the RapidAPI key in environment variables.

## Usage
- Start the server with `rails s`.
- Use the API endpoints for wallet transactions and stock price retrieval.

