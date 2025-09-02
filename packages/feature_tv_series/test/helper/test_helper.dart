import 'package:core/data/datasources/db/database_helper.dart';
import 'package:feature_tv_series/data/datasources/tv_series_local_data_source.dart';
import 'package:feature_tv_series/data/datasources/tv_series_remote_data_source.dart';
import 'package:feature_tv_series/domain/repositories/tv_series_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;

@GenerateMocks(
  [
    DatabaseHelper,
    TvSeriesRepository,
    TvSeriesRemoteDataSource,
    TvSeriesLocalDataSource,
  ],
  customMocks: [MockSpec<http.Client>(as: #MockHttpClient)],
)
void main() {}
