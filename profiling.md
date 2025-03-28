# Profiling

## Leak detection

with valgrind:

```sh
valgrind --leak-check=full --show-leak-kinds=all --log-file=valgrind-out.txt -- ./ForgeHomulator.run ./config/config_4.cfg padd 45 35 15
```

## Callgrind

```sh
valgrind --tool=callgrind -- ./ForgeHomulator.run ./config/config_4.cfg padd 45 35 15
```
