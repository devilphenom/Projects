// main.go

package main

import (
	"encoding/json"
	"fmt"
	"net/http"
	"sort"
	"sync"
	"time"
)

type RequestPayload struct {
	ToSort [][]int `json:"to_sort"`
}

type ResponsePayload struct {
	SortedArrays [][]int `json:"sorted_arrays"`
	TimeNS       int64   `json:"time_ns"`
}

func processSingleHandler(w http.ResponseWriter, r *http.Request) {
	var requestData RequestPayload
	err := json.NewDecoder(r.Body).Decode(&requestData)
	if err != nil {
		http.Error(w, "Invalid request payload", http.StatusBadRequest)
		return
	}

	startTime := time.Now()
	sortedArrays := make([][]int, len(requestData.ToSort))

	for i, arr := range requestData.ToSort {
		sort.Ints(arr)
		sortedArrays[i] = arr
	}

	elapsedTime := time.Since(startTime).Nanoseconds()

	response := ResponsePayload{
		SortedArrays: sortedArrays,
		TimeNS:       elapsedTime,
	}

	sendJSONResponse(w, response)
}

func processConcurrentHandler(w http.ResponseWriter, r *http.Request) {
	var requestData RequestPayload
	err := json.NewDecoder(r.Body).Decode(&requestData)
	if err != nil {
		http.Error(w, "Invalid request payload", http.StatusBadRequest)
		return
	}

	startTime := time.Now()
	var wg sync.WaitGroup
	sortedArrays := make([][]int, len(requestData.ToSort))
	mutex := sync.Mutex{}

	for i, arr := range requestData.ToSort {
		wg.Add(1)
		go func(i int, arr []int) {
			defer wg.Done()
			sort.Ints(arr)
			mutex.Lock()
			sortedArrays[i] = arr
			mutex.Unlock()
		}(i, arr)
	}

	wg.Wait()
	elapsedTime := time.Since(startTime).Nanoseconds()

	response := ResponsePayload{
		SortedArrays: sortedArrays,
		TimeNS:       elapsedTime,
	}

	sendJSONResponse(w, response)
}

func sendJSONResponse(w http.ResponseWriter, data interface{}) {
	w.Header().Set("Content-Type", "application/json")
	err := json.NewEncoder(w).Encode(data)
	if err != nil {
		http.Error(w, "Internal Server Error", http.StatusInternalServerError)
		return
	}
}

func main() {
	http.HandleFunc("/process-single", processSingleHandler)
	http.HandleFunc("/process-concurrent", processConcurrentHandler)

	port := 8000
	fmt.Printf("Server listening on port %d...\n", port)
	http.ListenAndServe(fmt.Sprintf(":%d", port), nil)
}
