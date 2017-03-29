class parent {
include child
Notify {
message => 'This is parent scope',
}
notify {'one': }
}
class child {
notify { 'two': }
}
include parent
