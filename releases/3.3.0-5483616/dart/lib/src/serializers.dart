//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_import

import 'package:one_of_serializer/any_of_serializer.dart';
import 'package:one_of_serializer/one_of_serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:tomb_contracts/src/date_serializer.dart';
import 'package:tomb_contracts/src/model/date.dart';

import 'package:tomb_contracts/src/model/associate_nfc200_response.dart';
import 'package:tomb_contracts/src/model/associate_nfc200_response_all_of_data.dart';
import 'package:tomb_contracts/src/model/associate_nfc_request.dart';
import 'package:tomb_contracts/src/model/backend_capabilities.dart';
import 'package:tomb_contracts/src/model/chunk_upload_result.dart';
import 'package:tomb_contracts/src/model/cleanup_stale_sessions200_response.dart';
import 'package:tomb_contracts/src/model/cleanup_stale_sessions200_response_all_of_data.dart';
import 'package:tomb_contracts/src/model/cleanup_stale_sessions200_response_all_of_data_cleaned_sessions_inner.dart';
import 'package:tomb_contracts/src/model/create_playlist201_response.dart';
import 'package:tomb_contracts/src/model/create_playlist_request.dart';
import 'package:tomb_contracts/src/model/download_you_tube200_response.dart';
import 'package:tomb_contracts/src/model/download_you_tube200_response_all_of_data.dart';
import 'package:tomb_contracts/src/model/download_you_tube_request.dart';
import 'package:tomb_contracts/src/model/finalize_upload200_response.dart';
import 'package:tomb_contracts/src/model/finalize_upload_request.dart';
import 'package:tomb_contracts/src/model/get_health200_response.dart';
import 'package:tomb_contracts/src/model/get_nfc_status200_response.dart';
import 'package:tomb_contracts/src/model/get_nfc_status200_response_all_of_data.dart';
import 'package:tomb_contracts/src/model/get_system_info200_response.dart';
import 'package:tomb_contracts/src/model/get_system_info200_response_all_of_data.dart';
import 'package:tomb_contracts/src/model/get_system_logs200_response.dart';
import 'package:tomb_contracts/src/model/get_system_logs200_response_all_of_data.dart';
import 'package:tomb_contracts/src/model/get_upload_status200_response.dart';
import 'package:tomb_contracts/src/model/get_you_tube_download_status200_response.dart';
import 'package:tomb_contracts/src/model/health_status.dart';
import 'package:tomb_contracts/src/model/health_status_services.dart';
import 'package:tomb_contracts/src/model/init_upload_session201_response.dart';
import 'package:tomb_contracts/src/model/init_upload_session_request.dart';
import 'package:tomb_contracts/src/model/list_playlists200_response.dart';
import 'package:tomb_contracts/src/model/list_playlists200_response_all_of_data.dart';
import 'package:tomb_contracts/src/model/list_upload_sessions200_response.dart';
import 'package:tomb_contracts/src/model/list_upload_sessions200_response_all_of_data.dart';
import 'package:tomb_contracts/src/model/move_track_request.dart';
import 'package:tomb_contracts/src/model/nfc_association.dart';
import 'package:tomb_contracts/src/model/player_play200_response.dart';
import 'package:tomb_contracts/src/model/player_play_request.dart';
import 'package:tomb_contracts/src/model/player_seek_request.dart';
import 'package:tomb_contracts/src/model/player_state.dart';
import 'package:tomb_contracts/src/model/playlist_detailed.dart';
import 'package:tomb_contracts/src/model/playlist_summary.dart';
import 'package:tomb_contracts/src/model/remove_tracks_from_playlist_request.dart';
import 'package:tomb_contracts/src/model/reorder_playlist_request.dart';
import 'package:tomb_contracts/src/model/restart_system200_response.dart';
import 'package:tomb_contracts/src/model/restart_system200_response_all_of_data.dart';
import 'package:tomb_contracts/src/model/scan_nfc200_response.dart';
import 'package:tomb_contracts/src/model/scan_nfc200_response_all_of_data.dart';
import 'package:tomb_contracts/src/model/scan_nfc_request.dart';
import 'package:tomb_contracts/src/model/search_you_tube200_response.dart';
import 'package:tomb_contracts/src/model/search_you_tube200_response_all_of_data.dart';
import 'package:tomb_contracts/src/model/set_volume200_response.dart';
import 'package:tomb_contracts/src/model/set_volume200_response_all_of_data.dart';
import 'package:tomb_contracts/src/model/set_volume_request.dart';
import 'package:tomb_contracts/src/model/start_playlist200_response.dart';
import 'package:tomb_contracts/src/model/start_playlist200_response_all_of_data.dart';
import 'package:tomb_contracts/src/model/sync_playlists200_response.dart';
import 'package:tomb_contracts/src/model/sync_playlists200_response_all_of_data.dart';
import 'package:tomb_contracts/src/model/sync_playlists_request.dart';
import 'package:tomb_contracts/src/model/system_info.dart';
import 'package:tomb_contracts/src/model/track.dart';
import 'package:tomb_contracts/src/model/unified_response.dart';
import 'package:tomb_contracts/src/model/unified_response_data.dart';
import 'package:tomb_contracts/src/model/update_playlist200_response.dart';
import 'package:tomb_contracts/src/model/update_playlist_request.dart';
import 'package:tomb_contracts/src/model/upload_chunk200_response.dart';
import 'package:tomb_contracts/src/model/upload_finalize_result.dart';
import 'package:tomb_contracts/src/model/upload_session.dart';
import 'package:tomb_contracts/src/model/upload_session_status.dart';
import 'package:tomb_contracts/src/model/you_tube_download_status.dart';
import 'package:tomb_contracts/src/model/you_tube_search_result.dart';

part 'serializers.g.dart';

@SerializersFor([
  AssociateNFC200Response,
  AssociateNFC200ResponseAllOfData,
  AssociateNFCRequest,
  BackendCapabilities,
  ChunkUploadResult,
  CleanupStaleSessions200Response,
  CleanupStaleSessions200ResponseAllOfData,
  CleanupStaleSessions200ResponseAllOfDataCleanedSessionsInner,
  CreatePlaylist201Response,
  CreatePlaylistRequest,
  DownloadYouTube200Response,
  DownloadYouTube200ResponseAllOfData,
  DownloadYouTubeRequest,
  FinalizeUpload200Response,
  FinalizeUploadRequest,
  GetHealth200Response,
  GetNFCStatus200Response,
  GetNFCStatus200ResponseAllOfData,
  GetSystemInfo200Response,
  GetSystemInfo200ResponseAllOfData,
  GetSystemLogs200Response,
  GetSystemLogs200ResponseAllOfData,
  GetUploadStatus200Response,
  GetYouTubeDownloadStatus200Response,
  HealthStatus,
  HealthStatusServices,
  InitUploadSession201Response,
  InitUploadSessionRequest,
  ListPlaylists200Response,
  ListPlaylists200ResponseAllOfData,
  ListUploadSessions200Response,
  ListUploadSessions200ResponseAllOfData,
  MoveTrackRequest,
  NFCAssociation,
  PlayerPlay200Response,
  PlayerPlayRequest,
  PlayerSeekRequest,
  PlayerState,
  PlaylistDetailed,
  PlaylistSummary,
  RemoveTracksFromPlaylistRequest,
  ReorderPlaylistRequest,
  RestartSystem200Response,
  RestartSystem200ResponseAllOfData,
  ScanNFC200Response,
  ScanNFC200ResponseAllOfData,
  ScanNFCRequest,
  SearchYouTube200Response,
  SearchYouTube200ResponseAllOfData,
  SetVolume200Response,
  SetVolume200ResponseAllOfData,
  SetVolumeRequest,
  StartPlaylist200Response,
  StartPlaylist200ResponseAllOfData,
  SyncPlaylists200Response,
  SyncPlaylists200ResponseAllOfData,
  SyncPlaylistsRequest,
  SystemInfo,
  Track,
  UnifiedResponse,$UnifiedResponse,
  UnifiedResponseData,
  UpdatePlaylist200Response,
  UpdatePlaylistRequest,
  UploadChunk200Response,
  UploadFinalizeResult,
  UploadSession,
  UploadSessionStatus,
  YouTubeDownloadStatus,
  YouTubeSearchResult,
])
Serializers serializers = (_$serializers.toBuilder()
      ..add(UnifiedResponse.serializer)
      ..add(const OneOfSerializer())
      ..add(const AnyOfSerializer())
      ..add(const DateSerializer())
      ..add(Iso8601DateTimeSerializer())
    ).build();

Serializers standardSerializers =
    (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
