package main

import (
    "encoding/json"
    "fmt"
    "log"
    "net/http"
    "time"
)

// Server represents our web server configuration
type Server struct {
    Host    string        `json:"host"`
    Port    int           `json:"port"`
    Timeout time.Duration `json:"timeout"`
}

// Response represents the API response structure
type Response struct {
    Status    string    `json:"status"`
    Message   string    `json:"message"`
    Timestamp time.Time `json:"timestamp"`
    Data      any       `json:"data,omitempty"`
}

// NewServer creates a new server instance with default values
func NewServer() *Server {
    return &Server{
        Host:    "localhost",
        Port:    8080,
        Timeout: 30 * time.Second,
    }
}

// Start initializes and starts the HTTP server
func (s *Server) Start() error {
    addr := fmt.Sprintf("%s:%d", s.Host, s.Port)

    mux := http.NewServeMux()
    mux.HandleFunc("/api/health", s.healthHandler)
    mux.HandleFunc("/api/data", s.dataHandler)

    server := &http.Server{
        Addr:         addr,
        Handler:      mux,
        ReadTimeout:  s.Timeout,
        WriteTimeout: s.Timeout,
    }

    log.Printf("Server starting on %s", addr)
    return server.ListenAndServe()
}

// healthHandler returns the server health status
func (s *Server) healthHandler(w http.ResponseWriter, r *http.Request) {
    response := Response{
        Status:    "success",
        Message:   "Server is healthy",
        Timestamp: time.Now(),
    }

    s.sendJSON(w, http.StatusOK, response)
}

// dataHandler returns sample data
func (s *Server) dataHandler(w http.ResponseWriter, r *http.Request) {
    data := map[string]interface{}{
        "items": []string{"item1", "item2", "item3"},
        "count": 3,
    }

    response := Response{
        Status:    "success",
        Message:   "Data retrieved successfully",
        Timestamp: time.Now(),
        Data:      data,
    }

    s.sendJSON(w, http.StatusOK, response)
}

// sendJSON sends a JSON response
func (s *Server) sendJSON(w http.ResponseWriter, status int, data any) {
    w.Header().Set("Content-Type", "application/json")
    w.WriteHeader(status)

    if err := json.NewEncoder(w).Encode(data); err != nil {
        log.Printf("Error encoding JSON: %v", err)
    }
}

func main() {
    server := NewServer()
    if err := server.Start(); err != nil {
        log.Fatalf("Server failed to start: %v", err)
    }
}