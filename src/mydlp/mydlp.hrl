%%%
%%%    Copyright (C) 2010 Huseyin Kerem Cevahir <kerem@medra.com.tr>
%%%
%%%--------------------------------------------------------------------------
%%%    This file is part of MyDLP.
%%%
%%%    MyDLP is free software: you can redistribute it and/or modify
%%%    it under the terms of the GNU General Public License as published by
%%%    the Free Software Foundation, either version 3 of the License, or
%%%    (at your option) any later version.
%%%
%%%    MyDLP is distributed in the hope that it will be useful,
%%%    but WITHOUT ANY WARRANTY; without even the implied warranty of
%%%    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%%%    GNU General Public License for more details.
%%%
%%%    You should have received a copy of the GNU General Public License
%%%    along with MyDLP.  If not, see <http://www.gnu.org/licenses/>.
%%%--------------------------------------------------------------------------

-ifndef(_MYDLP_HRL).
-define(_MYDLP_HRL, true).

-include("mydlp_big_binary.hrl").

-define(CFG(Key), mydlp_config:Key()).

% creates new Fun with encapsulates orginal fun to Log any Exception 
-define(FLE(Fun), fun() -> mydlp_api:log_exception(Fun) end).

-define(ACL_LOG(Proto, RuleId, Action, Ip, User, To, Matcher, File, Misc), 
	mydlp_api:acl_msg(Proto, RuleId, Action, Ip, User, To, Matcher, File, Misc)).

-define(ERROR_LOG(Format, Args),
	mydlp_logger:notify(error, ?MODULE_STRING ":" ++ integer_to_list(?LINE) ++ " " ++ Format, Args ++ 32)).

-define(DEBUG(Format, Args),
	mydlp_logger:debug_msg(?MODULE,?LINE,Format, Args)).

-define(INFO_MSG(Format, Args),
	mydlp_logger:info_msg(?MODULE,?LINE,Format, Args)).

-define(S, "~P").

%%%%%%%

%% end of import

-record(file, {
                name,
                filename,
                mime_type,
                given_type,
                data,
		dataref,
		text,
		compressed_copy = false,
		is_encrypted = false
        }).

-endif.
