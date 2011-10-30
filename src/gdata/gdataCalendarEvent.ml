open GdataUtils.Op

(* Calendar event data types *)
type calendar_calendarRecurrenceExceptionEntry = {
  cree_etag : string;
  cree_authors : GdataAtom.atom_author list;
  cree_categories : GdataAtom.atom_category list;
  cree_content : GdataAtom.atom_content;
  cree_contributors : GdataAtom.atom_contributor list;
  cree_id : GdataAtom.atom_id;
  cree_published : GdataAtom.atom_published;
  cree_updated : GdataAtom.atom_updated;
  cree_comments : GdataCalendarComment.calendar_calendarComments;
  cree_links : GdataCalendar.calendar_calendarLink list;
  cree_where : GdataCalendar.calendar_calendarWhere list;
  cree_who : GdataCalendar.calendar_calendarWho list;
  cree_icalUID : GdataCalendar.calendar_icalUIDProperty;
  cree_sequenceNumber : GdataCalendar.calendar_sequenceNumberProperty;
  cree_title : GdataAtom.atom_textConstruct;
  cree_eventStatus : GdataCalendar.gdata_eventStatus;
  cree_originalEvent : GdataCalendar.gdata_originalEvent;
  cree_transparency : GdataCalendar.gdata_transparency;
  cree_visibility : GdataCalendar.gdata_visibility;
  cree_when : GdataCalendar.gdata_when list;
  cree_extensions : (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t list
}

let empty_recurrenceExceptionEntry = {
  cree_etag = "";
  cree_authors = [];
  cree_categories = [];
  cree_content = GdataAtom.empty_content;
  cree_contributors = [];
  cree_id = "";
  cree_published = GdataDate.epoch;
  cree_updated = GdataDate.epoch;
  cree_comments = GdataCalendarComment.empty_comments;
  cree_links = [];
  cree_where = [];
  cree_who = [];
  cree_icalUID = "";
  cree_sequenceNumber = 0;
  cree_title = GdataAtom.empty_text;
  cree_eventStatus = "";
  cree_originalEvent = GdataCalendar.empty_originalEvent;
  cree_transparency = "";
  cree_visibility = "";
  cree_when = [];
  cree_extensions = []
}

type calendar_calendarRecurrenceException = {
  cre_specialized : bool;
  cre_entry : calendar_calendarRecurrenceExceptionEntry
}

let empty_recurrenceException = {
  cre_specialized = false;
  cre_entry = empty_recurrenceExceptionEntry
}

type calendar_calendarEventEntry = {
  cee_etag : string;
  cee_kind : string;
  cee_authors : GdataAtom.atom_author list;
  cee_content : GdataAtom.atom_content;
  cee_contributors : GdataAtom.atom_contributor list;
  cee_id : GdataAtom.atom_id;
  cee_published : GdataAtom.atom_published;
  cee_updated : GdataAtom.atom_updated;
  cee_edited : GdataAtom.app_edited;
  cee_comments : GdataCalendarComment.calendar_calendarComments;
  cee_extendedProperties : GdataCalendar.calendar_calendarExtendedProperty list;
  cee_links : GdataCalendar.calendar_calendarLink list;
  cee_recurrenceExceptions : calendar_calendarRecurrenceException list;
  cee_where : GdataCalendar.calendar_calendarWhere list;
  cee_who : GdataCalendar.calendar_calendarWho list;
  cee_icalUID : GdataCalendar.calendar_icalUIDProperty;
  cee_privateCopy : GdataCalendar.calendar_privateCopyProperty;
  cee_quickAdd : GdataCalendar.calendar_quickAddProperty;
  cee_sendEventNotifications : GdataCalendar.calendar_sendEventNotificationsProperty;
  cee_sequenceNumber : GdataCalendar.calendar_sequenceNumberProperty;
  cee_syncEvent : GdataCalendar.calendar_syncEventProperty;
  cee_summary : GdataAtom.atom_textConstruct;
  cee_title : GdataAtom.atom_textConstruct;
  cee_eventKind : GdataCalendar.gdata_kind;
  cee_eventStatus : GdataCalendar.gdata_eventStatus;
  cee_originalEvent : GdataCalendar.gdata_originalEvent;
  cee_recurrence : GdataCalendar.gdata_recurrence;
  cee_reminders : GdataCalendar.gdata_reminder list;
  cee_transparency : GdataCalendar.gdata_transparency;
  cee_visibility : GdataCalendar.gdata_visibility;
  cee_when : GdataCalendar.gdata_when list;
  cee_anyoneCanAddSelf : bool;
  cee_guestsCanInviteOthers : bool;
  cee_guestsCanModify : bool;
  cee_guestsCanSeeGuests : bool;
  cee_extensions : (GdataCore.Metadata.xml, GdataCore.Value.t) GdataCore.AnnotatedTree.t list
}

let empty_eventEntry = {
  cee_etag = "";
  cee_kind = "";
  cee_authors = [];
  cee_content = GdataAtom.empty_content;
  cee_contributors = [];
  cee_id = "";
  cee_published = GdataDate.epoch;
  cee_updated = GdataDate.epoch;
  cee_edited = GdataDate.epoch;
  cee_comments = GdataCalendarComment.empty_comments;
  cee_extendedProperties = [];
  cee_links = [];
  cee_recurrenceExceptions = [];
  cee_where = [];
  cee_who = [];
  cee_icalUID = "";
  cee_privateCopy = false;
  cee_quickAdd = false;
  cee_sendEventNotifications = false;
  cee_sequenceNumber = 0;
  cee_syncEvent = false;
  cee_summary = GdataAtom.empty_text;
  cee_title = GdataAtom.empty_text;
  cee_eventKind = GdataCalendar.eventKind;
  cee_eventStatus = "";
  cee_originalEvent = GdataCalendar.empty_originalEvent;
  cee_recurrence = "";
  cee_reminders = [];
  cee_transparency = "";
  cee_visibility = "";
  cee_when = [];
  cee_anyoneCanAddSelf = false;
  cee_guestsCanInviteOthers = false;
  cee_guestsCanModify = false;
  cee_guestsCanSeeGuests = false;
  cee_extensions = []
}

type calendar_calendarEventFeed = {
  cef_etag : string;
  cef_kind : string;
  cef_authors : GdataAtom.atom_author list;
  cef_contributors : GdataAtom.atom_contributor list;
  cef_generator : GdataAtom.atom_generator;
  cef_id : GdataAtom.atom_id;
  cef_updated : GdataAtom.atom_updated;
  cef_entries : calendar_calendarEventEntry list;
  cef_links : GdataCalendar.calendar_calendarLink list;
  cef_timezone : GdataCalendar.calendar_timeZoneProperty;
  cef_timesCleaned : GdataCalendar.calendar_timesCleanedProperty;
  cef_subtitle : GdataAtom.atom_textConstruct;
  cef_title : GdataAtom.atom_textConstruct;
  cef_eventKind : GdataCalendar.gdata_kind;
  cef_itemsPerPage : GdataAtom.opensearch_itemsPerPage;
  cef_startIndex : GdataAtom.opensearch_startIndex;
  cef_totalResults : GdataAtom.opensearch_totalResults
}

let empty_eventFeed = {
  cef_etag = "";
  cef_kind = "";
  cef_authors = [];
  cef_contributors = [];
  cef_generator = GdataAtom.empty_generator;
  cef_id = "";
  cef_updated = GdataDate.epoch;
  cef_entries = [];
  cef_links = [];
  cef_timezone = "";
  cef_timesCleaned = 0;
  cef_subtitle = GdataAtom.empty_text;
  cef_title = GdataAtom.empty_text;
  cef_eventKind = GdataCalendar.eventKind;
  cef_itemsPerPage = 0;
  cef_startIndex = 0;
  cef_totalResults = 0
}
(* END Calendar event data types *)


(* Calendar event feed: parsing *)
let parse_recurrenceExceptionEntry entry tree =
  match tree with
      GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name "etag"; `Namespace ns],
         GdataCore.Value.String v) when ns = GdataCalendar.ns_gd ->
        { entry with cree_etag = v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "author"; `Namespace ns],
         cs) when ns = GdataAtom.ns_atom ->
        GdataAtom.parse_children
          GdataAtom.parse_author
          GdataAtom.empty_author
          (fun author -> { entry with cree_authors =
                             author :: entry.cree_authors })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "category"; `Namespace ns],
         cs) when ns = GdataAtom.ns_atom ->
        GdataAtom.parse_children
          GdataAtom.parse_category
          GdataAtom.empty_category
          (fun category ->
             { entry with cree_categories = category :: entry.cree_categories })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "content"; `Namespace ns],
         cs) when ns = GdataAtom.ns_atom ->
        GdataAtom.parse_children
          GdataAtom.parse_content
          GdataAtom.empty_content
          (fun content -> { entry with cree_content = content })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "contributor"; `Namespace ns],
         cs) when ns = GdataAtom.ns_atom ->
        GdataAtom.parse_children
          GdataAtom.parse_author
          GdataAtom.empty_author
          (fun contributor -> { entry with cree_contributors =
                                  contributor :: entry.cree_contributors })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "id"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Text], GdataCore.Value.String v)]) when ns = GdataAtom.ns_atom ->
        { entry with cree_id = v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "published"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Text], GdataCore.Value.String v)]) when ns = GdataAtom.ns_atom ->
        { entry with cree_published = GdataDate.of_string v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "updated"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Text], GdataCore.Value.String v)]) when ns = GdataAtom.ns_atom ->
        { entry with cree_updated = GdataDate.of_string v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "comments"; `Namespace ns],
         cs) when ns = GdataCalendar.ns_gd ->
        GdataAtom.parse_children
          GdataCalendarComment.parse_comments
          GdataCalendarComment.empty_comments
          (fun comments -> { entry with cree_comments = comments })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "link"; `Namespace ns],
         cs) when ns = GdataAtom.ns_atom ->
        GdataAtom.parse_children
          GdataCalendar.parse_link
          GdataCalendar.empty_link
          (fun link -> { entry with cree_links = link :: entry.cree_links })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "where"; `Namespace ns],
         cs) when ns = GdataCalendar.ns_gd ->
        GdataAtom.parse_children
          GdataCalendar.parse_where
          ""
          (fun where -> { entry with cree_where = where :: entry.cree_where })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "who"; `Namespace ns],
         cs) when ns = GdataCalendar.ns_gd ->
        GdataAtom.parse_children
          GdataCalendar.parse_who
          GdataCalendar.empty_who
          (fun who -> { entry with cree_who = who :: entry.cree_who })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "uid"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Attribute; `Name "value"; `Namespace ""],
             GdataCore.Value.String v)]) when ns = GdataCalendar.ns_gCal ->
        { entry with cree_icalUID = v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "sequence"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Attribute; `Name "value"; `Namespace ""],
             GdataCore.Value.String v)]) when ns = GdataCalendar.ns_gCal ->
        { entry with cree_sequenceNumber = int_of_string v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "title"; `Namespace ns],
         cs) when ns = GdataAtom.ns_atom ->
        GdataAtom.parse_children
          GdataAtom.parse_text
          GdataAtom.empty_text
          (fun title -> { entry with cree_title = title })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "eventStatus"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Attribute; `Name "value"; `Namespace ""],
             GdataCore.Value.String v)]) when ns = GdataCalendar.ns_gd ->
        { entry with cree_eventStatus = v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "originalEvent"; `Namespace ns],
         cs) when ns = GdataCalendar.ns_gd ->
        GdataAtom.parse_children
          GdataCalendar.parse_originalEvent
          GdataCalendar.empty_originalEvent
          (fun event -> { entry with cree_originalEvent = event })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "transparency"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Attribute; `Name "value"; `Namespace ""],
             GdataCore.Value.String v)]) when ns = GdataCalendar.ns_gd ->
        { entry with cree_transparency = v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "visibility"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Attribute; `Name "value"; `Namespace ""],
             GdataCore.Value.String v)]) when ns = GdataCalendar.ns_gd ->
        { entry with cree_visibility = v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "when"; `Namespace ns],
         cs) when ns = GdataCalendar.ns_gd ->
        GdataAtom.parse_children
          GdataCalendar.parse_when
          GdataCalendar.empty_when
          (fun cwhen -> { entry with cree_when = cwhen :: entry.cree_when })
          cs
    | extension ->
        let extensions = extension :: entry.cree_extensions in
          { entry with cree_extensions = extensions }

let parse_recurrenceExceptionEntryLink entry tree =
  match tree with
      GdataCore.AnnotatedTree.Node
        ([`Element; `Name "entry"; `Namespace ns],
         cs) when ns = GdataAtom.ns_atom ->
        GdataAtom.parse_children
          parse_recurrenceExceptionEntry
          empty_recurrenceExceptionEntry
          Std.identity
          cs
    | e ->
        GdataUtils.unexpected e

let parse_recurrenceException ex tree =
  match tree with
      GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name "specialized"; `Namespace ns],
         GdataCore.Value.String v) when ns = "" ->
        { ex with cre_specialized = bool_of_string v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "entryLink"; `Namespace ns],
         cs) when ns = GdataCalendar.ns_gd ->
        GdataAtom.parse_children
          parse_recurrenceExceptionEntryLink
          empty_recurrenceExceptionEntry
          (fun entry -> { ex with cre_entry = entry })
          cs
    | e ->
        GdataUtils.unexpected e

let parse_entry entry tree =
  match tree with
      GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name "etag"; `Namespace ns],
         GdataCore.Value.String v) when ns = GdataCalendar.ns_gd ->
        { entry with cee_etag = v }
    | GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name "kind"; `Namespace ns],
         GdataCore.Value.String v) when ns = GdataCalendar.ns_gd ->
        { entry with cee_kind = v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "author"; `Namespace ns],
         cs) when ns = GdataAtom.ns_atom ->
        GdataAtom.parse_children
          GdataAtom.parse_author
          GdataAtom.empty_author
          (fun author -> { entry with cee_authors =
                             author :: entry.cee_authors })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "content"; `Namespace ns],
         cs) when ns = GdataAtom.ns_atom ->
        GdataAtom.parse_children
          GdataAtom.parse_content
          GdataAtom.empty_content
          (fun content -> { entry with cee_content = content })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "contributor"; `Namespace ns],
         cs) when ns = GdataAtom.ns_atom ->
        GdataAtom.parse_children
          GdataAtom.parse_author
          GdataAtom.empty_author
          (fun contributor -> { entry with cee_contributors =
                                  contributor :: entry.cee_contributors })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "id"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Text], GdataCore.Value.String v)]) when ns = GdataAtom.ns_atom ->
        { entry with cee_id = v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "published"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Text], GdataCore.Value.String v)]) when ns = GdataAtom.ns_atom ->
        { entry with cee_published = GdataDate.of_string v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "updated"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Text], GdataCore.Value.String v)]) when ns = GdataAtom.ns_atom ->
        { entry with cee_updated = GdataDate.of_string v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "edited"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Text], GdataCore.Value.String v)]) when ns = GdataAtom.ns_app ->
        { entry with cee_edited = GdataDate.of_string v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "comments"; `Namespace ns],
         cs) when ns = GdataCalendar.ns_gd ->
        GdataAtom.parse_children
          GdataCalendarComment.parse_comments
          GdataCalendarComment.empty_comments
          (fun comments -> { entry with cee_comments = comments })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "extendedProperty"; `Namespace ns],
         cs) when ns = GdataCalendar.ns_gd ->
        GdataAtom.parse_children
          GdataCalendar.parse_extendedProperty
          GdataCalendar.empty_extendedProperty
          (fun property ->
             { entry with cee_extendedProperties =
                 property :: entry.cee_extendedProperties })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "link"; `Namespace ns],
         cs) when ns = GdataAtom.ns_atom ->
        GdataAtom.parse_children
          GdataCalendar.parse_link
          GdataCalendar.empty_link
          (fun link -> { entry with cee_links = link :: entry.cee_links })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "recurrenceException"; `Namespace ns],
         cs) when ns = GdataCalendar.ns_gd ->
        GdataAtom.parse_children
          parse_recurrenceException
          empty_recurrenceException
          (fun ex ->
             { entry with cee_recurrenceExceptions =
                 ex :: entry.cee_recurrenceExceptions })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "where"; `Namespace ns],
         cs) when ns = GdataCalendar.ns_gd ->
        GdataAtom.parse_children
          GdataCalendar.parse_where
          ""
          (fun where -> { entry with cee_where = where :: entry.cee_where })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "who"; `Namespace ns],
         cs) when ns = GdataCalendar.ns_gd ->
        GdataAtom.parse_children
          GdataCalendar.parse_who
          GdataCalendar.empty_who
          (fun who -> { entry with cee_who = who :: entry.cee_who })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "uid"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Attribute; `Name "value"; `Namespace ""],
             GdataCore.Value.String v)]) when ns = GdataCalendar.ns_gCal ->
        { entry with cee_icalUID = v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "privateCopy"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Attribute; `Name "value"; `Namespace ""],
             GdataCore.Value.String v)]) when ns = GdataCalendar.ns_gCal ->
        { entry with cee_privateCopy = bool_of_string v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "quickadd"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Attribute; `Name "value"; `Namespace ""],
             GdataCore.Value.String v)]) when ns = GdataCalendar.ns_gCal ->
        { entry with cee_quickAdd = bool_of_string v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "sequence"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Attribute; `Name "value"; `Namespace ""],
             GdataCore.Value.String v)]) when ns = GdataCalendar.ns_gCal ->
        { entry with cee_sequenceNumber = int_of_string v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "title"; `Namespace ns],
         cs) when ns = GdataAtom.ns_atom ->
        GdataAtom.parse_children
          GdataAtom.parse_text
          GdataAtom.empty_text
          (fun title -> { entry with cee_title = title })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "category"; `Namespace ns],
         _) when ns = GdataAtom.ns_atom ->
        { entry with cee_eventKind = GdataCalendar.eventKind }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "eventStatus"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Attribute; `Name "value"; `Namespace ""],
             GdataCore.Value.String v)]) when ns = GdataCalendar.ns_gd ->
        { entry with cee_eventStatus = v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "originalEvent"; `Namespace ns],
         cs) when ns = GdataCalendar.ns_gd ->
        GdataAtom.parse_children
          GdataCalendar.parse_originalEvent
          GdataCalendar.empty_originalEvent
          (fun event -> { entry with cee_originalEvent = event })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "recurrence"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Attribute; `Name "value"; `Namespace ""],
             GdataCore.Value.String v)]) when ns = GdataCalendar.ns_gd ->
        { entry with cee_recurrence = v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "transparency"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Attribute; `Name "value"; `Namespace ""],
             GdataCore.Value.String v)]) when ns = GdataCalendar.ns_gd ->
        { entry with cee_transparency = v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "visibility"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Attribute; `Name "value"; `Namespace ""],
             GdataCore.Value.String v)]) when ns = GdataCalendar.ns_gd ->
        { entry with cee_visibility = v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "when"; `Namespace ns],
         cs) when ns = GdataCalendar.ns_gd ->
        GdataAtom.parse_children
          GdataCalendar.parse_when
          GdataCalendar.empty_when
          (fun cwhen -> { entry with cee_when = cwhen :: entry.cee_when })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "anyoneCanAddSelf"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Attribute; `Name "value"; `Namespace ""],
             GdataCore.Value.String v)]) when ns = GdataCalendar.ns_gCal ->
        { entry with cee_anyoneCanAddSelf = bool_of_string v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "guestsCanInviteOthers"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Attribute; `Name "value"; `Namespace ""],
             GdataCore.Value.String v)]) when ns = GdataCalendar.ns_gCal ->
        { entry with cee_guestsCanInviteOthers = bool_of_string v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "guestsCanModify"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Attribute; `Name "value"; `Namespace ""],
             GdataCore.Value.String v)]) when ns = GdataCalendar.ns_gCal ->
        { entry with cee_guestsCanModify = bool_of_string v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "guestsCanSeeGuests"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Attribute; `Name "value"; `Namespace ""],
             GdataCore.Value.String v)]) when ns = GdataCalendar.ns_gCal ->
        { entry with cee_guestsCanSeeGuests = bool_of_string v }
    | GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name _; `Namespace ns],
         _) when ns = Xmlm.ns_xmlns ->
        entry
    | extension ->
        let extensions = extension :: entry.cee_extensions in
          { entry with cee_extensions = extensions }

let parse_feed feed tree =
  match tree with
      GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name "etag"; `Namespace ns],
         GdataCore.Value.String v) when ns = GdataCalendar.ns_gd ->
        { feed with cef_etag = v }
    | GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name "kind"; `Namespace ns],
         GdataCore.Value.String v) when ns = GdataCalendar.ns_gd ->
        { feed with cef_kind = v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "author"; `Namespace ns],
         cs) when ns = GdataAtom.ns_atom ->
        GdataAtom.parse_children
          GdataAtom.parse_author
          GdataAtom.empty_author
          (fun author -> { feed with cef_authors = author :: feed.cef_authors })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "contributor"; `Namespace ns],
         cs) when ns = GdataAtom.ns_atom ->
        GdataAtom.parse_children
          GdataAtom.parse_author
          GdataAtom.empty_author
          (fun contributor -> { feed with cef_contributors =
                                  contributor :: feed.cef_contributors })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "generator"; `Namespace ns],
         cs) when ns = GdataAtom.ns_atom ->
        GdataAtom.parse_children
          GdataAtom.parse_generator
          GdataAtom.empty_generator
          (fun generator -> { feed with cef_generator = generator })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "id"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Text], GdataCore.Value.String v)]) when ns = GdataAtom.ns_atom ->
        { feed with cef_id = v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "updated"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Text], GdataCore.Value.String v)]) when ns = GdataAtom.ns_atom ->
        { feed with cef_updated = GdataDate.of_string v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "entry"; `Namespace ns],
         cs) when ns = GdataAtom.ns_atom ->
        GdataAtom.parse_children
          parse_entry
          empty_eventEntry
          (fun entry -> { feed with cef_entries = entry :: feed.cef_entries })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "link"; `Namespace ns],
         cs) when ns = GdataAtom.ns_atom ->
        GdataAtom.parse_children
          GdataCalendar.parse_link
          GdataCalendar.empty_link
          (fun link -> { feed with cef_links = link :: feed.cef_links })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "timezone"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Attribute; `Name "value"; `Namespace ""],
             GdataCore.Value.String v)]) when ns = GdataCalendar.ns_gCal ->
        { feed with cef_timezone = v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "timesCleaned"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Attribute; `Name "value"; `Namespace ""],
             GdataCore.Value.String v)]) when ns = GdataCalendar.ns_gCal ->
        { feed with cef_timesCleaned = int_of_string v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "subtitle"; `Namespace ns],
         cs) when ns = GdataAtom.ns_atom ->
        GdataAtom.parse_children
          GdataAtom.parse_text
          GdataAtom.empty_text
          (fun subtitle -> { feed with cef_subtitle = subtitle })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "title"; `Namespace ns],
         cs) when ns = GdataAtom.ns_atom ->
        GdataAtom.parse_children
          GdataAtom.parse_text
          GdataAtom.empty_text
          (fun title -> { feed with cef_title = title })
          cs
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "category"; `Namespace ns],
         _) when ns = GdataAtom.ns_atom ->
        { feed with cef_eventKind = GdataCalendar.eventKind }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "itemsPerPage"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Text], GdataCore.Value.String v)]) when ns = GdataAtom.ns_openSearch ->
        { feed with cef_itemsPerPage = int_of_string v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "startIndex"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Text], GdataCore.Value.String v)]) when ns = GdataAtom.ns_openSearch ->
        { feed with cef_startIndex = int_of_string v }
    | GdataCore.AnnotatedTree.Node
        ([`Element; `Name "totalResults"; `Namespace ns],
         [GdataCore.AnnotatedTree.Leaf
            ([`Text], GdataCore.Value.String v)]) when ns = GdataAtom.ns_openSearch ->
        { feed with cef_totalResults = int_of_string v }
    | GdataCore.AnnotatedTree.Leaf
        ([`Attribute; `Name _; `Namespace ns],
         _) when ns = Xmlm.ns_xmlns ->
        feed
    | e ->
        GdataUtils.unexpected e

let parse_calendar_event_feed tree =
  let parse_root tree =
    match tree with
        GdataCore.AnnotatedTree.Node
          ([`Element; `Name "feed"; `Namespace ns],
           cs) when ns = GdataAtom.ns_atom ->
          GdataAtom.parse_children
            parse_feed
            empty_eventFeed
            Std.identity
            cs
      | e ->
          GdataUtils.unexpected e
  in
    parse_root tree

let parse_calendar_event_entry tree =
  let parse_root tree =
    match tree with
        GdataCore.AnnotatedTree.Node
          ([`Element; `Name "entry"; `Namespace ns],
           cs) when ns = GdataAtom.ns_atom ->
          GdataAtom.parse_children
            parse_entry
            empty_eventEntry
            Std.identity
            cs
      | e ->
          GdataUtils.unexpected e
  in
    parse_root tree
(* END Calendar event feed: parsing *)


(* Calendar event feed: rendering *)
let render_recurrenceExceptionEntry entry =
  GdataAtom.render_element GdataAtom.ns_atom "entry"
    [GdataAtom.render_attribute GdataCalendar.ns_gd "etag" entry.cree_etag;
     GdataAtom.render_element_list (GdataAtom.render_author "author") entry.cree_authors;
     GdataAtom.render_element_list GdataAtom.render_category entry.cree_categories;
     GdataAtom.render_content entry.cree_content;
     GdataAtom.render_element_list (GdataAtom.render_author "contributor") entry.cree_contributors;
     GdataAtom.render_text_element GdataAtom.ns_atom "id" entry.cree_id;
     GdataAtom.render_date_element GdataAtom.ns_atom "published" entry.cree_published;
     GdataAtom.render_date_element GdataAtom.ns_atom "updated" entry.cree_updated;
     GdataCalendarComment.render_comments entry.cree_comments;
     GdataAtom.render_element_list GdataCalendar.render_link entry.cree_links;
     GdataAtom.render_element_list GdataCalendar.render_where entry.cree_where;
     GdataAtom.render_element_list GdataCalendar.render_who entry.cree_who;
     GdataAtom.render_value GdataCalendar.ns_gd "uid" entry.cree_icalUID;
     GdataAtom.render_int_value GdataCalendar.ns_gd "sequence" entry.cree_sequenceNumber;
     GdataAtom.render_text_construct "title" entry.cree_title;
     GdataAtom.render_value GdataCalendar.ns_gd "eventStatus" entry.cree_eventStatus;
     GdataCalendar.render_originalEvent entry.cree_originalEvent;
     GdataAtom.render_value GdataCalendar.ns_gd "transparency" entry.cree_transparency;
     GdataAtom.render_value GdataCalendar.ns_gd "visibility" entry.cree_visibility;
     GdataAtom.render_element_list GdataCalendar.render_when entry.cree_when;
     entry.cree_extensions]

let render_recurrenceExceptionEntryLink entry =
  GdataAtom.render_element GdataCalendar.ns_gd "entryLink"
    [render_recurrenceExceptionEntry entry]

let render_recurrenceException ex =
  GdataAtom.render_element GdataCalendar.ns_gd "recurrenceException"
    [GdataAtom.render_bool_attribute "" "specialized" ex.cre_specialized;
     render_recurrenceExceptionEntryLink ex.cre_entry]

let calendar_event_entry_to_data_model entry =
  let entry_element =
    (* TODO: better namespace handling *)
    GdataAtom.render_element GdataAtom.ns_atom "entry"
      [GdataAtom.render_attribute Xmlm.ns_xmlns "xmlns" GdataAtom.ns_atom;
       GdataAtom.render_attribute Xmlm.ns_xmlns "gCal" GdataCalendar.ns_gCal;
       GdataAtom.render_attribute Xmlm.ns_xmlns "gd" GdataCalendar.ns_gd;
       GdataAtom.render_attribute Xmlm.ns_xmlns "app" GdataAtom.ns_app;
       GdataAtom.render_attribute GdataCalendar.ns_gd "kind" entry.cee_kind;
       GdataAtom.render_element_list (GdataAtom.render_author "author") entry.cee_authors;
       GdataAtom.render_content entry.cee_content;
       GdataAtom.render_element_list (GdataAtom.render_author "contributor") entry.cee_contributors;
       GdataAtom.render_text_element GdataAtom.ns_atom "id" entry.cee_id;
       GdataAtom.render_date_element GdataAtom.ns_atom "published" entry.cee_published;
       GdataAtom.render_date_element GdataAtom.ns_atom "updated" entry.cee_updated;
       GdataAtom.render_date_element GdataAtom.ns_app "edited" entry.cee_edited;
       GdataCalendarComment.render_comments entry.cee_comments;
       GdataAtom.render_element_list GdataCalendar.render_extendedProperty entry.cee_extendedProperties;
       GdataAtom.render_element_list GdataCalendar.render_link entry.cee_links;
       GdataAtom.render_element_list render_recurrenceException entry.cee_recurrenceExceptions;
       GdataAtom.render_element_list GdataCalendar.render_where entry.cee_where;
       GdataAtom.render_element_list GdataCalendar.render_who entry.cee_who;
       GdataAtom.render_value GdataCalendar.ns_gd "uid" entry.cee_icalUID;
       GdataAtom.render_bool_value GdataCalendar.ns_gCal "privateCopy" entry.cee_privateCopy;
       GdataAtom.render_bool_value GdataCalendar.ns_gCal "quickadd" entry.cee_quickAdd;
       GdataAtom.render_int_value GdataCalendar.ns_gd "sequence" entry.cee_sequenceNumber;
       GdataAtom.render_text_construct "title" entry.cee_title;
       GdataAtom.render_category
         { GdataAtom.empty_category with
               GdataAtom.c_scheme = entry.cee_eventKind.GdataCalendar.k_scheme;
               GdataAtom.c_term = entry.cee_eventKind.GdataCalendar.k_term };
       GdataAtom.render_value GdataCalendar.ns_gd "eventStatus" entry.cee_eventStatus;
       GdataCalendar.render_originalEvent entry.cee_originalEvent;
       GdataAtom.render_text_element GdataCalendar.ns_gd "recurrence" entry.cee_recurrence;
       GdataAtom.render_value GdataCalendar.ns_gd "transparency" entry.cee_transparency;
       GdataAtom.render_value GdataCalendar.ns_gd "visibility" entry.cee_visibility;
       GdataAtom.render_element_list GdataCalendar.render_when entry.cee_when;
       GdataAtom.render_bool_value GdataCalendar.ns_gCal "anyoneCanAddSelf" entry.cee_anyoneCanAddSelf;
       GdataAtom.render_bool_value GdataCalendar.ns_gCal "guestsCanInviteOthers" entry.cee_guestsCanInviteOthers;
       GdataAtom.render_bool_value GdataCalendar.ns_gCal "guestsCanModify" entry.cee_guestsCanModify;
       GdataAtom.render_bool_value GdataCalendar.ns_gCal "guestsCanSeeGuests" entry.cee_guestsCanSeeGuests;
       entry.cee_extensions]
  in

    List.hd entry_element
(* END Calendar event feed: rendering *)
