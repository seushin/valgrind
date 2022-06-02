# valgrind for macos with docker

맥에서도 valgrind를 써보고 싶어 만든 스크립트. docker를 사용합니다.

## Installation
```bash
make
# or
make cluster
```

## Usage
```bash
valgrind ./YOUR_EXEC_FILE
# or
valgrind --build "make re" ./YOUR_EXEC_FILE
```
