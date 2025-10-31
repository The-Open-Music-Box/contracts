# Socket.IO Events Reference

Complete reference for all real-time Socket.IO events in TheOpenMusicBox.

## Event Categories

### 1. Connection Events

Events related to WebSocket connection lifecycle.

#### `connect`
**Direction:** Client → Server
**Payload:** None
**Description:** Client establishes connection to server

#### `disconnect`
**Direction:** Client → Server
**Payload:** None
**Description:** Client disconnects from server

#### `connection_status`
**Direction:** Server → Client
**Payload:**
```typescript
{
  status: "connected",
  sid: string,
  server_seq: number,
  server_time: number
}
```
**Description:** Server confirms connection and provides initial state

#### `client_ping`
**Direction:** Client → Server
**Payload:**
```typescript
{
  timestamp: number
}
```
**Description:** Client health check ping

#### `client_pong`
**Direction:** Server → Client
**Payload:**
```typescript
{
  timestamp: number,
  server_time: number,
  server_seq: number
}
```
**Description:** Server health check response

---

### 2. State Events

Server-authoritative state broadcasts using standardized envelope format.

**Envelope Structure:**
```typescript
{
  event_type: string,      // e.g., "state:player"
  server_seq: number,       // Global sequence number
  data: T,                  // Event-specific payload
  timestamp: number,        // Unix timestamp
  event_id: string,         // Unique event ID
  playlist_id?: string,     // Optional context
  playlist_seq?: number     // Optional playlist sequence
}
```

#### `state:player`
**Direction:** Server → Client
**Frequency:** On player state change
**Data:**
```typescript
{
  is_playing: boolean,
  active_playlist_id: string | null,
  active_playlist_title: string | null,
  active_track_id: string | null,
  active_track_number: number | null,
  active_track_title: string | null,
  position_ms: number,
  duration_ms: number | null,
  can_prev: boolean,
  can_next: boolean,
  volume: number | null,
  server_seq: number
}
```
**Description:** Complete player state update. Note: Individual track fields are provided instead of a full Track object.

#### `state:track_position`
**Direction:** Server → Client
**Frequency:** Every 500ms during playback
**Data:**
```typescript
{
  position_ms: number,
  track_id: string | null,
  is_playing: boolean,
  duration_ms: number | null
}
```
**Description:** Lightweight position updates for smooth UI

#### `state:playlists`
**Direction:** Server → Client
**Frequency:** On playlists collection change
**Data:**
```typescript
{
  playlists: Array<{
    id: string,
    title: string,
    track_count: number,
    nfc_tag_id: string | null,
    server_seq: number
  }>
}
```
**Description:** Global playlists collection state

#### `state:playlist`
**Direction:** Server → Client
**Frequency:** On specific playlist change
**Data:**
```typescript
{
  id: string,
  title: string,
  description: string,
  tracks: Track[],
  nfc_tag_id: string | null,
  server_seq: number
}
```
**Description:** Detailed playlist state

#### `state:playlist_created`
**Direction:** Server → Client
**Data:**
```typescript
{
  playlist: {
    id: string,
    title: string,
    description: string,
    tracks: Track[],
    server_seq: number
  }
}
```

#### `state:playlist_deleted`
**Direction:** Server → Client
**Data:**
```typescript
{
  playlist_id: string,
  message: string
}
```

#### `state:track_added`
**Direction:** Server → Client
**Data:**
```typescript
{
  playlist_id: string,
  track: Track
}
```

#### `state:track_deleted`
**Direction:** Server → Client
**Data:**
```typescript
{
  playlist_id: string,
  track_numbers: number[]
}
```

#### `state:volume_changed`
**Direction:** Server → Client
**Frequency:** On volume change
**Data:**
```typescript
{
  volume: number  // 0-100
}
```
**Description:** Volume level changed notification

---

### 3. Subscription Events

Room-based subscription management.

#### `join:playlists`
**Direction:** Client → Server
**Payload:** `{}`
**Description:** Subscribe to global playlists updates

#### `join:playlist`
**Direction:** Client → Server
**Payload:**
```typescript
{
  playlist_id: string
}
```
**Description:** Subscribe to specific playlist updates

#### `ack:join`
**Direction:** Server → Client
**Payload:**
```typescript
{
  room: string,
  success: boolean,
  server_seq: number,
  playlist_seq?: number,
  message?: string
}
```
**Description:** Subscription confirmation

#### `leave:playlist`
**Direction:** Client → Server
**Payload:**
```typescript
{
  playlist_id: string
}
```

---

### 4. Operation Events

Operation acknowledgments and errors.

#### `ack:op`
**Direction:** Server → Client
**Payload:**
```typescript
{
  client_op_id: string,
  success: true,
  data?: any,
  server_seq: number
}
```
**Description:** Operation succeeded

#### `err:op`
**Direction:** Server → Client
**Payload:**
```typescript
{
  client_op_id: string,
  success: false,
  message: string,
  error_type: string,
  server_seq: number
}
```
**Description:** Operation failed

---

### 5. Sync Events

Client-server state synchronization.

#### `sync:request`
**Direction:** Client → Server
**Payload:**
```typescript
{
  last_global_seq?: number,
  last_playlist_seqs?: Record<string, number>,
  requested_rooms?: string[]
}
```
**Description:** Client requests state synchronization

#### `sync:complete`
**Direction:** Server → Client
**Payload:**
```typescript
{
  current_global_seq: number,
  synced_rooms: string[]
}
```
**Description:** Server confirms synchronization complete

#### `sync:error`
**Direction:** Server → Client
**Payload:**
```typescript
{
  error: string,
  requested_rooms?: string[]
}
```
**Description:** Synchronization error

#### `client:request_current_state`
**Direction:** Client → Server
**Payload:**
```typescript
{
  timestamp?: number,
  client_id?: string,
  requested_states?: string[]
}
```
**Description:** Client requests immediate state snapshot

---

### 6. Upload Events

File upload progress tracking.

#### `upload:progress`
**Direction:** Server → Client
**Payload:**
```typescript
{
  playlist_id: string,
  session_id: string,
  progress: number,        // 0-100
  chunk_index: number,
  file_name: string,
  complete: boolean
}
```

#### `upload:complete`
**Direction:** Server → Client
**Payload:**
```typescript
{
  playlist_id: string,
  session_id: string,
  filename: string,
  track: Track
}
```

#### `upload:error`
**Direction:** Server → Client
**Payload:**
```typescript
{
  playlist_id: string,
  session_id: string,
  error: string,
  code: string
}
```

---

### 7. NFC Events

NFC tag association workflow.

#### `start_nfc_link`
**Direction:** Client → Server
**Payload:**
```typescript
{
  playlist_id: string,
  client_op_id?: string
}
```
**Description:** Start NFC tag association session

#### `stop_nfc_link`
**Direction:** Client → Server
**Payload:**
```typescript
{
  playlist_id: string,
  client_op_id?: string
}
```
**Description:** Cancel ongoing NFC association session

#### `override_nfc_tag`
**Direction:** Client → Server
**Payload:**
```typescript
{
  playlist_id: string,
  client_op_id?: string
}
```
**Description:** Override existing NFC tag association

#### `nfc_association_state`
**Direction:** Server → Client
**Payload:**
```typescript
{
  state: "activated" | "waiting" | "success" | "duplicate" | "timeout" | "cancelled" | "error",
  playlist_id?: string,
  tag_id?: string,
  message?: string,
  expires_at?: number,
  existing_playlist?: string,
  server_seq: number
}
```
**Description:** NFC association state changes

---

### 8. YouTube Events

YouTube download progress tracking.

#### `youtube:progress`
**Direction:** Server → Client
**Payload:**
```typescript
{
  task_id: string,
  status: "pending" | "downloading" | "processing" | "completed" | "failed",
  progress_percent?: number,
  current_step?: string
}
```
**Description:** YouTube download progress updates

#### `youtube:complete`
**Direction:** Server → Client
**Payload:**
```typescript
{
  task_id: string,
  track: Track,
  playlist_id: string
}
```
**Description:** YouTube download completed successfully

#### `youtube:error`
**Direction:** Server → Client
**Payload:**
```typescript
{
  task_id: string,
  message: string
}
```
**Description:** YouTube download failed

---

## Event Flow Examples

### Example 1: Playing a Track

```
1. Client: POST /api/player/play { client_op_id: "abc123" }
2. Server → All: state:player { is_playing: true, ... }
3. Server → Client: ack:op { client_op_id: "abc123", success: true }
4. Server → All: state:track_position (every 500ms)
```

### Example 2: Creating a Playlist

```
1. Client: POST /api/playlists { title: "My Playlist", client_op_id: "def456" }
2. Server → Room "playlists": state:playlist_created { playlist: { ... } }
3. Server → Room "playlists": state:playlists { playlists: [ ... ] }
4. HTTP Response 201: { data: { id: "...", ... } }
```

### Example 3: Uploading a File

```
1. Client: POST /api/playlists/{id}/uploads/session
2. Client: PUT /api/playlists/{id}/uploads/{session}/chunks/0
3. Server → Client: upload:progress { progress: 25, chunk_index: 0 }
4. Client: PUT /api/playlists/{id}/uploads/{session}/chunks/1
5. Server → Client: upload:progress { progress: 50, chunk_index: 1 }
   ...
6. Client: POST /api/playlists/{id}/uploads/{session}/finalize
7. Server → Client: upload:complete { track: { ... } }
8. Server → Room: state:track_added { playlist_id, track }
```

---

## Best Practices

### 1. Always Subscribe Before Making Changes

```typescript
// Subscribe to room first
socket.emit('join:playlist', { playlist_id: 'abc' });

// Wait for ack
socket.on('ack:join', (data) => {
  if (data.success) {
    // Now make API calls
    api.updatePlaylist('abc', { title: 'New Title' });
  }
});
```

### 2. Track Operation IDs

```typescript
const opId = generateOpId();

// Send operation
await api.playerPlay({ client_op_id: opId });

// Wait for acknowledgment
socket.once('ack:op', (data) => {
  if (data.client_op_id === opId) {
    console.log('Operation confirmed');
  }
});
```

### 3. Handle Sequence Numbers

```typescript
let lastServerSeq = 0;

socket.on('state:player', (envelope) => {
  if (envelope.server_seq > lastServerSeq) {
    // Apply update
    updatePlayerState(envelope.data);
    lastServerSeq = envelope.server_seq;
  }
});
```

---

## Troubleshooting

### Not Receiving Events

1. Check you're subscribed to the room:
   ```typescript
   socket.emit('join:playlists', {});
   ```

2. Verify connection:
   ```typescript
   socket.on('connection_status', (data) => {
     console.log('Connected:', data.sid);
   });
   ```

### Out-of-Order Events

Use `server_seq` to order events correctly:
```typescript
const eventQueue = [];
let expectedSeq = 0;

socket.on('state:*', (envelope) => {
  if (envelope.server_seq === expectedSeq + 1) {
    applyEvent(envelope);
    expectedSeq++;
  } else {
    eventQueue.push(envelope);
    // Process queued events
  }
});
```
