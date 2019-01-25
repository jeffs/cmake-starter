// Copyright 2019 <Jeff Schwab>

#include <filesystem>  // NOLINT
#include <iostream>
#include <vector>

int main() {
  std::filesystem::recursive_directory_iterator pos(".");
  std::vector<std::filesystem::path> paths(pos, {});
}
