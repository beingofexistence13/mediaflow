// # Copyright (C) 2010-2016  RhodeCode GmbH
// #
// # This program is free software: you can redistribute it and/or modify
// # it under the terms of the GNU Affero General Public License, version 3
// # (only), as published by the Free Software Foundation.
// #
// # This program is distributed in the hope that it will be useful,
// # but WITHOUT ANY WARRANTY; without even the implied warranty of
// # MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// # GNU General Public License for more details.
// #
// # You should have received a copy of the GNU Affero General Public License
// # along with this program.  If not, see <http://www.gnu.org/licenses/>.
// #
// # This program is dual-licensed. If you wish to learn more about the
// # RhodeCode Enterprise Edition, including its added features, Support services,
// # and proprietary license terms, please see https://rhodecode.com/licenses/

var addNewPatternInput = function(pattern, description, url, prefix){
    var _html = $('#add-row-tmpl tbody').html();
    var _next_id = $('.new_pattern').length;
    _html = _html.replace(/##UUID##/g, _next_id);
    _html = _html.replace(/##DESCRIPTION##/g, description || '');
    _html = _html.replace(/##PATTERN##/g, pattern || '');
    _html = _html.replace(/##URL##/g, url || '');
    _html = _html.replace(/##PREFIX##/g, prefix || '');
    $('#last-row').before(_html);
};
