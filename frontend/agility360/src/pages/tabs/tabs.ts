import { Component } from '@angular/core';

import { SettingsPage } from '../settings/settings';
import { TasksPage } from '../tasks/tasks';
import { JobsPage } from '../jobs/jobs';

@Component({
  templateUrl: 'tabs.html'
})
export class TabsPage {

  tab1Root = JobsPage;
  tab2Root = SettingsPage;
  tab3Root = SettingsPage;
  tab4Root = TasksPage;
  tab5Root = SettingsPage;

  constructor() {

  }
}
