#pragma once
#include <bits/stdc++.h>
using namespace std;

// for recursive call signatures are needed
template <typename T, typename S>
ostream& operator<<(ostream& out, const pair<T, S>& pr);

template <class T, class S, class C>
ostream& operator<<(ostream& out, const priority_queue<T, S, C>& q);

template <typename Container, typename S = typename enable_if<!is_same<Container, string>::value,
                                                              typename Container::value_type>::type>
ostream& operator<<(ostream& out, const Container& ct);

// pair
template <typename T, typename S>
ostream& operator<<(ostream& out, const pair<T, S>& pr) {
    return out << "(" << pr.first << ", " << pr.second << ")";
}

// priority_queue
template <class T, class S, class C>
ostream& operator<<(ostream& out, const priority_queue<T, S, C>& q) {
    struct HackedPQ : private priority_queue<T, S, C> {
        static const S& Container(const priority_queue<T, S, C>& q) {
            return q.*&HackedPQ::c;
        }
    };
    return out << HackedPQ::Container(q);
}

// everything else
template <typename Container, typename S>
ostream& operator<<(ostream& out, const Container& ct) {
    out << "{";
    bool first = true;
    for (auto&& el : ct) {
        if (!first) out << ", ";
        out << el;
        first = false;
    }
    return out << "}";
}

template <typename Tail>
void _dbg(const Tail T) {
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

/*
// -std=c20

template <typename T>
concept Iterable = requires(T a) {
    { a.begin() } -> input_or_output_iterator;
    { a.end() } -> input_or_output_iterator;
};

template <class T, class S, class C>
const S& Container(const priority_queue<T, S, C>& q) {
    struct HackedQueue : private priority_queue<T, S, C> {
        static const S& Container(const priority_queue<T, S, C>& q) {
            return q.*&HackedQueue::c;
        }
    };
    return HackedQueue::Container(q);
}

template <typename F, typename S>
ostream& operator<<(ostream& out, const pair<F, S>& p);

template <Iterable I, enable_if_t<!is_same_v<I, string>, bool>>
ostream& operator<<(ostream& out, const I& iterable);

template <class T, class S, class C>
ostream& operator<<(ostream& out, const priority_queue<T, S, C>& q);

template <typename F, typename S>
ostream& operator<<(ostream& out, const pair<F, S>& p) {
    return out << "(" << p.first << ", " << p.second << ")";
}

template <Iterable I, enable_if_t<!is_same_v<I, string>, bool> = true>
ostream& operator<<(ostream& out, const I& iterable) {
    out << "{";
    bool first = true;
    for (const auto& el : iterable) {
        if (!first) out << ", ";
        out << el;
        first = false;
    }
    return out << "}";
}

template <class T, class S, class C>
ostream& operator<<(ostream& out, const priority_queue<T, S, C>& q) {
    return out << Container(q);
}

template <typename T>
void _dbg(const T& arg) {
    cerr << arg << '\n';
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
*/
