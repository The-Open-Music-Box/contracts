# Code Examples

Practical examples for using TheOpenMusicBox contracts in each supported language.

## Flutter/Dart Example

### Setup

```yaml
# pubspec.yaml
dependencies:
  tomb_contracts:
    path: ../tomb-contracts/releases/v3.2.0/dart/
  dio: ^5.0.0
```

### Basic Usage

```dart
import 'package:tomb_contracts/tomb_contracts.dart';

void main() async {
  // Initialize API client
  final api = TombContractsApi(
    baseUrl: 'http://tomb-rpi.local:8000',
  );

  // Get player status
  try {
    final response = await api.getPlayerStatus();
    final PlayerState state = response.data;

    print('Playing: ${state.isPlaying}');
    print('Track: ${state.activeTrackTitle ?? "No track"}');
    print('Position: ${state.positionMs}ms / ${state.durationMs ?? 0}ms');
  } catch (e) {
    print('Error: $e');
  }

  // Control playback
  await api.playerToggle(
    requestBody: {'client_op_id': 'flutter-${DateTime.now().millisecondsSinceEpoch}'}
  );

  // List playlists
  final playlistsResponse = await api.listPlaylists(page: 1, limit: 20);
  final playlists = playlistsResponse.data.playlists;

  for (var playlist in playlists) {
    print('${playlist.title} (${playlist.trackCount} tracks)');
  }

  // Create new playlist
  final createResponse = await api.createPlaylist(
    requestBody: {
      'title': 'My Flutter Playlist',
      'description': 'Created from Flutter app',
      'client_op_id': 'flutter-create-${DateTime.now().millisecondsSinceEpoch}'
    }
  );

  print('Created playlist: ${createResponse.data.id}');
}
```

### Flutter Widget Example

```dart
import 'package:flutter/material.dart';
import 'package:tomb_contracts/tomb_contracts.dart';

class PlayerWidget extends StatefulWidget {
  @override
  _PlayerWidgetState createState() => _PlayerWidgetState();
}

class _PlayerWidgetState extends State<PlayerWidget> {
  final api = TombContractsApi(baseUrl: 'http://tomb-rpi.local:8000');
  PlayerState? playerState;

  @override
  void initState() {
    super.initState();
    _loadPlayerState();
  }

  Future<void> _loadPlayerState() async {
    try {
      final response = await api.getPlayerStatus();
      setState(() {
        playerState = response.data;
      });
    } catch (e) {
      print('Error loading player state: $e');
    }
  }

  Future<void> _togglePlayback() async {
    await api.playerToggle();
    await _loadPlayerState();
  }

  @override
  Widget build(BuildContext context) {
    if (playerState == null) {
      return CircularProgressIndicator();
    }

    return Column(
      children: [
        Text(
          playerState!.activeTrackTitle ?? 'No track',
          style: Theme.of(context).textTheme.headline6,
        ),
        Slider(
          value: playerState!.positionMs.toDouble(),
          max: playerState!.durationMs?.toDouble() ?? 1.0,
          onChanged: (value) {
            api.playerSeek(requestBody: {'position_ms': value.toInt()});
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.skip_previous),
              onPressed: playerState!.canPrev ? () => api.playerPrevious() : null,
            ),
            IconButton(
              icon: Icon(playerState!.isPlaying ? Icons.pause : Icons.play_arrow),
              onPressed: _togglePlayback,
            ),
            IconButton(
              icon: Icon(Icons.skip_next),
              onPressed: playerState!.canNext ? () => api.playerNext() : null,
            ),
          ],
        ),
      ],
    );
  }
}
```

---

## C++ Example

### Setup

```cmake
# CMakeLists.txt
cmake_minimum_required(VERSION 3.15)
project(TombClient)

set(CMAKE_CXX_STANDARD 17)

# Add contracts library
add_subdirectory(../tomb-contracts/releases/v3.2.0/cpp)

add_executable(tomb_client main.cpp)
target_link_libraries(tomb_client TombContracts)
```

### Basic Usage

```cpp
#include <iostream>
#include "TombContracts/api/PlayerApi.h"
#include "TombContracts/api/PlaylistsApi.h"

using namespace org::openapitools::client::api;
using namespace org::openapitools::client::model;

int main() {
    // Initialize API clients
    PlayerApi playerApi("http://tomb-rpi.local:8000");
    PlaylistsApi playlistsApi("http://tomb-rpi.local:8000");

    try {
        // Get player status
        auto statusResponse = playerApi.getPlayerStatus().get();
        auto state = statusResponse.data;

        std::cout << "Playing: " << (state.isPlaying ? "Yes" : "No") << std::endl;
        std::cout << "Position: " << state.positionMs << "ms" << std::endl;

        if (state.activeTrackTitle) {
            std::cout << "Track: " << *state.activeTrackTitle << std::endl;
        }

        // Toggle playback
        web::json::value toggleBody;
        toggleBody[U("client_op_id")] = web::json::value::string(U("cpp-client"));
        playerApi.playerToggle(toggleBody).wait();

        // List playlists
        auto playlistsResponse = playlistsApi.listPlaylists(1, 10).get();
        auto playlists = playlistsResponse.data.playlists;

        std::cout << "\nPlaylists:" << std::endl;
        for (const auto& playlist : playlists) {
            std::cout << "  - " << playlist.title
                     << " (" << playlist.trackCount << " tracks)"
                     << std::endl;
        }

        // Create playlist
        web::json::value createBody;
        createBody[U("title")] = web::json::value::string(U("C++ Test Playlist"));
        createBody[U("description")] = web::json::value::string(U("Created from C++"));

        auto createResponse = playlistsApi.createPlaylist(createBody).get();
        std::cout << "\nCreated playlist: " << createResponse.data.id << std::endl;

    } catch (const std::exception& e) {
        std::cerr << "Error: " << e.what() << std::endl;
        return 1;
    }

    return 0;
}
```

### ESP32 Example (Arduino Framework)

```cpp
#include <WiFi.h>
#include <HTTPClient.h>
#include <ArduinoJson.h>

const char* ssid = "your-wifi";
const char* password = "your-password";
const char* apiBase = "http://tomb-rpi.local:8000";

void setup() {
    Serial.begin(115200);

    // Connect to WiFi
    WiFi.begin(ssid, password);
    while (WiFi.status() != WL_CONNECTED) {
        delay(500);
        Serial.print(".");
    }
    Serial.println("\nConnected!");
}

void togglePlayback() {
    HTTPClient http;
    http.begin(String(apiBase) + "/api/player/toggle");
    http.addHeader("Content-Type", "application/json");

    StaticJsonDocument<200> doc;
    doc["client_op_id"] = "esp32-" + String(millis());

    String requestBody;
    serializeJson(doc, requestBody);

    int httpCode = http.POST(requestBody);

    if (httpCode == 200) {
        String response = http.getString();
        Serial.println("Playback toggled");
    }

    http.end();
}

void getPlayerStatus() {
    HTTPClient http;
    http.begin(String(apiBase) + "/api/player/status");

    int httpCode = http.GET();

    if (httpCode == 200) {
        String payload = http.getString();

        DynamicJsonDocument doc(2048);
        deserializeJson(doc, payload);

        bool isPlaying = doc["data"]["is_playing"];
        const char* track = doc["data"]["active_track"]["title"];

        Serial.printf("Playing: %s\n", isPlaying ? "Yes" : "No");
        Serial.printf("Track: %s\n", track);
    }

    http.end();
}

void loop() {
    getPlayerStatus();
    delay(2000);
}
```

---

## TypeScript Example

### Setup

```typescript
// Add to your existing project
import type {
  PlayerState,
  Playlist,
  Track,
  UnifiedResponse
} from '../tomb-contracts/releases/v3.2.0/typescript';
```

### API Client

```typescript
class TombApiClient {
  private baseUrl: string;

  constructor(baseUrl: string = 'http://tomb-rpi.local:8000') {
    this.baseUrl = baseUrl;
  }

  private async request<T>(
    endpoint: string,
    options?: RequestInit
  ): Promise<UnifiedResponse<T>> {
    const response = await fetch(`${this.baseUrl}${endpoint}`, {
      ...options,
      headers: {
        'Content-Type': 'application/json',
        ...options?.headers,
      },
    });

    if (!response.ok) {
      throw new Error(`HTTP ${response.status}: ${response.statusText}`);
    }

    return response.json();
  }

  async getPlayerStatus(): Promise<PlayerState> {
    const response = await this.request<PlayerState>('/api/player/status');
    return response.data!;
  }

  async playerToggle(clientOpId?: string): Promise<PlayerState> {
    const response = await this.request<PlayerState>('/api/player/toggle', {
      method: 'POST',
      body: JSON.stringify({ client_op_id: clientOpId }),
    });
    return response.data!;
  }

  async listPlaylists(page = 1, limit = 50): Promise<Playlist[]> {
    const response = await this.request<{ playlists: Playlist[] }>(
      `/api/playlists?page=${page}&limit=${limit}`
    );
    return response.data!.playlists;
  }

  async createPlaylist(title: string, description?: string): Promise<Playlist> {
    const response = await this.request<Playlist>('/api/playlists', {
      method: 'POST',
      body: JSON.stringify({ title, description }),
    });
    return response.data!;
  }
}

// Usage
const api = new TombApiClient();

async function main() {
  // Get player status
  const state = await api.getPlayerStatus();
  console.log('Playing:', state.is_playing);
  console.log('Track:', state.active_track_title || 'No track');

  // Toggle playback
  await api.playerToggle('web-client-' + Date.now());

  // List playlists
  const playlists = await api.listPlaylists();
  playlists.forEach(p => {
    console.log(`${p.title} (${p.track_count} tracks)`);
  });
}
```

### Vue.js Component Example

```vue
<template>
  <div class="player">
    <div v-if="playerState">
      <h2>{{ playerState.active_track_title || 'No track' }}</h2>

      <input
        type="range"
        :value="playerState.position_ms"
        :max="playerState.duration_ms || 0"
        @change="seek"
      />

      <div class="controls">
        <button
          @click="previous"
          :disabled="!playerState.can_prev"
        >
          Previous
        </button>
        <button @click="toggle">
          {{ playerState.is_playing ? 'Pause' : 'Play' }}
        </button>
        <button
          @click="next"
          :disabled="!playerState.can_next"
        >
          Next
        </button>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue';
import type { PlayerState } from '../contracts/releases/v3.2.0/typescript';
import { TombApiClient } from './api-client';

const api = new TombApiClient();
const playerState = ref<PlayerState | null>(null);

async function loadState() {
  playerState.value = await api.getPlayerStatus();
}

async function toggle() {
  await api.playerToggle();
  await loadState();
}

async function previous() {
  await api.request('/api/player/previous', { method: 'POST' });
  await loadState();
}

async function next() {
  await api.request('/api/player/next', { method: 'POST' });
  await loadState();
}

async function seek(event: Event) {
  const value = (event.target as HTMLInputElement).valueAsNumber;
  await api.request('/api/player/seek', {
    method: 'POST',
    body: JSON.stringify({ position_ms: value })
  });
}

onMounted(() => {
  loadState();
  setInterval(loadState, 1000); // Poll for updates
});
</script>
```

---

## Python Example

### Setup

```python
# requirements.txt
requests
pydantic

# Or use the generated models directly
```

### Basic Usage

```python
import requests
from typing import Optional
from contracts.releases.v3_2_0.python.models import PlayerState, Playlist

class TombApiClient:
    def __init__(self, base_url: str = "http://tomb-rpi.local:8000"):
        self.base_url = base_url
        self.session = requests.Session()

    def get_player_status(self) -> PlayerState:
        """Get current player status with full type safety"""
        response = self.session.get(f"{self.base_url}/api/player/status")
        response.raise_for_status()
        data = response.json()["data"]
        return PlayerState(**data)

    def player_toggle(self, client_op_id: Optional[str] = None) -> PlayerState:
        """Toggle playback"""
        response = self.session.post(
            f"{self.base_url}/api/player/toggle",
            json={"client_op_id": client_op_id}
        )
        response.raise_for_status()
        data = response.json()["data"]
        return PlayerState(**data)

    def list_playlists(self, page: int = 1, limit: int = 50) -> list[Playlist]:
        """List all playlists"""
        response = self.session.get(
            f"{self.base_url}/api/playlists",
            params={"page": page, "limit": limit}
        )
        response.raise_for_status()
        data = response.json()["data"]
        return [Playlist(**p) for p in data["playlists"]]

    def create_playlist(self, title: str, description: str = "") -> Playlist:
        """Create new playlist"""
        response = self.session.post(
            f"{self.base_url}/api/playlists",
            json={"title": title, "description": description}
        )
        response.raise_for_status()
        data = response.json()["data"]
        return Playlist(**data)

# Usage
if __name__ == "__main__":
    api = TombApiClient()

    # Get player status (fully typed!)
    state = api.get_player_status()
    print(f"Playing: {state.is_playing}")
    print(f"Track: {state.active_track_title or 'None'}")
    print(f"Position: {state.position_ms}ms")

    # Toggle playback
    api.player_toggle(client_op_id="python-client")

    # List playlists
    playlists = api.list_playlists()
    for playlist in playlists:
        print(f"{playlist.title} ({playlist.track_count} tracks)")

    # Create playlist
    new_playlist = api.create_playlist("Test Playlist", "From Python")
    print(f"Created: {new_playlist.id}")
```

---

## Socket.IO Integration Examples

### TypeScript/JavaScript

```typescript
import { io, Socket } from 'socket.io-client';
import type { StateEventEnvelope, PlayerState } from '../contracts';

const socket: Socket = io('http://tomb-rpi.local:8000');

// Handle connection
socket.on('connection_status', (data) => {
  console.log('Connected:', data.sid);
  console.log('Server sequence:', data.server_seq);

  // Subscribe to player updates
  socket.emit('join:playlists', {});
});

// Handle player state updates
socket.on('state:player', (envelope: StateEventEnvelope<PlayerState>) => {
  console.log('Player state updated:', envelope.data);
  console.log('Sequence:', envelope.server_seq);

  // Update UI
  updatePlayerUI(envelope.data);
});

// Handle operation acknowledgments
socket.on('ack:op', (ack) => {
  console.log('Operation succeeded:', ack.client_op_id);
});

socket.on('err:op', (error) => {
  console.error('Operation failed:', error.message);
});
```

### Flutter/Dart

```dart
import 'package:socket_io_client/socket_io_client.dart' as IO;

final socket = IO.io('http://tomb-rpi.local:8000', <String, dynamic>{
  'transports': ['websocket'],
  'autoConnect': true,
});

socket.on('connection_status', (data) {
  print('Connected: ${data['sid']}');
  socket.emit('join:playlists', {});
});

socket.on('state:player', (data) {
  final envelope = data as Map<String, dynamic>;
  final playerData = envelope['data'] as Map<String, dynamic>;

  // Convert to PlayerState model
  final state = PlayerState.fromJson(playerData);

  // Update UI
  setState(() {
    this.playerState = state;
  });
});
```

---

## Testing Examples

### Integration Test (TypeScript)

```typescript
import { TombApiClient } from './api-client';

describe('TheOpenMusicBox API', () => {
  let api: TombApiClient;

  beforeAll(() => {
    api = new TombApiClient('http://localhost:8000');
  });

  test('should get player status', async () => {
    const state = await api.getPlayerStatus();

    expect(state).toBeDefined();
    expect(typeof state.is_playing).toBe('boolean');
    expect(typeof state.position_ms).toBe('number');
  });

  test('should list playlists', async () => {
    const playlists = await api.listPlaylists();

    expect(Array.isArray(playlists)).toBe(true);
    playlists.forEach(p => {
      expect(p.id).toBeDefined();
      expect(p.title).toBeDefined();
      expect(typeof p.track_count).toBe('number');
    });
  });
});
```
