#-- copyright
# OpenProject is a project management system.
# Copyright (C) 2012-2015 the OpenProject Foundation (OPF)
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License version 3.
#
# OpenProject is a fork of ChiliProject, which is a fork of Redmine. The copyright follows:
# Copyright (C) 2006-2013 Jean-Philippe Lang
# Copyright (C) 2010-2013 the ChiliProject Team
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
#
# See doc/COPYRIGHT.rdoc for more details.
#++

require 'spec_helper'

describe ::API::V3::Categories::CategoryRepresenter do
  let(:category) { FactoryGirl.build(:category) }
  let(:representer) { described_class.new(category) }

  context 'generation' do
    subject(:generated) { representer.to_json }

    it { is_expected.to include_json('Category'.to_json).at_path('_type') }

    xit { is_expected.to have_json_type(Object).at_path('_links') }
    xit 'should link to self' do
      expect(subject).to have_json_path('_links/self/href')
    end

    describe 'category' do
      it { is_expected.to have_json_path('id') }
      it { is_expected.to have_json_path('name') }
    end
  end
end
