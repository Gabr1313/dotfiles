#pragma once
#include <bits/stdc++.h>
#include <unordered_map>
using namespace std;

template <typename T, typename S>
ostream& operator<<(ostream& o, pair<T, S>& p);

template <typename Container,
		  typename S = typename enable_if<!is_same<Container, string>::value,
										  typename Container::value_type>::type>
ostream& operator<<(ostream& __out, Container& __ct);

template <typename T, typename S>
ostream& operator<<(ostream& o, pair<T, S>& p) {
	return o << "(" << p.first << ", " << p.second << ")";
}

template <typename Container, typename S>
ostream& operator<<(ostream& __out, Container& __ct) {
	__out << "{";
	bool first = true;
	for (auto&& __el : __ct) {
		if (!first) __out << ", ";
		__out << __el;
		first = false;
	}
	return __out << "}";
}

template <typename Tail>
void _dbg(Tail T) {
	cerr << T << endl;
}

template <typename Head, typename... Tail>
void _dbg(Head H, Tail... T) {
	cerr << H << ", ";
	_dbg(T...);
}

#define dbg(...)                              \
	do {                                      \
		cerr << "[" << #__VA_ARGS__ << "]: "; \
		_dbg(__VA_ARGS__);                    \
	} while (0)
