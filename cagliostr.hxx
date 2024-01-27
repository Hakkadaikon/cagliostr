#ifndef _CAGLIOSTR_H_
#define _CAGLIOSTR_H_

#include <algorithm>
#include <exception>
#include <iostream>
#include <sstream>
#include <string>

#include <libbech32/bech32.h>
#include <nlohmann/json.hpp>

#include <spdlog/cfg/env.h>
#include <spdlog/spdlog.h>

#include <Server.h>

#include "version.h"

typedef struct event_t {
  std::string id;
  std::string pubkey;
  std::time_t created_at;
  int kind;
  std::vector<std::vector<std::string>> tags;
  std::string content;
  std::string sig;
} event_t;

typedef struct filter_t {
  std::vector<std::string> ids{};
  std::vector<std::string> authors{};
  std::vector<int> kinds{};
  std::vector<std::vector<std::string>> tags{};
  std::time_t since{};
  std::time_t until{};
  int limit{500};
  std::string search;
} filter_t;

typedef struct subscriber_t {
  std::string sub;
  ws28::Client *client{};
  std::vector<filter_t> filters;
} subscriber_t;

void storage_init(const std::string &);
void storage_deinit();
bool insert_record(const event_t &);

bool send_records(std::function<void(const nlohmann::json &)>,
                  const std::string &, const std::vector<filter_t> &, bool);

void relay_send(ws28::Client *, const nlohmann::json &);
bool delete_record_by_id(const std::string &);
bool delete_record_by_kind_and_pubkey(int, const std::string &);
bool delete_record_by_kind_and_pubkey_and_dtag(
    int, const std::string &, const std::vector<std::string> &);

#endif
