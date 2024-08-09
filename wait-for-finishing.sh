function task1() {
    echo "task1..."
    sleep 5
}
function task2() {
    echo "task2..."
    sleep 2
}
task1 &
task2 &

# operator for waiting of finishing
wait

echo "All done!"
