Feature: Updating work packages
  Background:
    Given there is 1 user with:
      | login     | manager |
      | firstname | the     |
      | lastname  | manager |
    And there is a role "manager"
    And the role "manager" may have the following rights:
      | edit_work_packages |
      | view_work_packages |
    And there is 1 project with the following:
      | identifier | ecookbook |
      | name       | ecookbook |
    And I am working in project "ecookbook"
    And the user "manager" is a "manager"
    And there are the following priorities:
      | name  | default |
      | prio1 | true    |
      | prio2 |         |
    And there are the following status:
      | name    | default |
      | status1 | true    |
      | status2 |         |
    And there are the following planning elements in project "ecookbook":
      | subject |
      | pe1     |
    And I am already logged in as "manager"

  Scenario: Updating the work package and seeing the results on the show page
    When I go to the edit page of the work package called "pe1"
    And I fill in the following:
      | Responsible    | the manager |
      | Assignee       | the manager |
      | Start date     | 2013-03-04  |
      | Due date       | 2013-03-06  |
      | Estimated time | 5.00        |
      | % done         | 30 %        |
      | Priority       | prio2       |
    And I submit the form by the "Submit" button

    Then I should be on the page of the work package "pe1"
    And the work package should be shown with the following values:
      | Responsible    | the manager |
      | Assignee       | the manager |
      | Start date     | 03/04/2013  |
      | Due date       | 03/06/2013  |
      | Estimated time | 5.00        |
      | % done         | 30          |
      | Priority       | prio2       |
