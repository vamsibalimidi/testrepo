
search_smaps() {
    local pid="$1"
    local segment_id="$2"
    
    # Check if smaps file exists and is readable
    if [ ! -r "/proc/$pid/smaps" ]; then
        return 1
    fi
    
    # Search for the segment ID in smaps
    if grep -q "$segment_id" "/proc/$pid/smaps"; then
        # Get process name
        PROC_NAME=$(ps -p "$pid" -o comm=)
        
        echo "Found segment $segment_id in process:"
        echo "PID: $pid"
        echo "Process Name: $PROC_NAME"
        
        # Extract relevant smaps entries
        echo "Matching smaps entries:"
        grep -A3 "$segment_id" "/proc/$pid/smaps"
        
        return 0
    fi
    
    return 1
}



search_seg() {
# Counter for found processes
FOUND_COUNT=0

SEGMENT_ID=$1
echo "Searching for $SEGMENT_ID"
# Iterate over all process IDs in /proc
for PID in /proc/[0-9]*; do
    # Extract just the PID number
    CURRENT_PID=$(basename "$PID")
    
    # Skip if not a valid PID
    [[ ! "$CURRENT_PID" =~ ^[0-9]+$ ]] && continue
    
    # Search smaps for the segment
    if search_smaps "$CURRENT_PID" "$SEGMENT_ID"; then
        ((FOUND_COUNT++))
    fi
done

# Final summary
if [ $FOUND_COUNT -eq 0 ]; then
    echo "No processes found with segment $SEGMENT_ID"
fi
}
